require "devise_trusender/version"

# include Devise::Mailers::Helpers

module DeviseTruSender
  # class Error < StandardError; end

  def self.get_ts_token
	 return @@trusendr_token  	
  end

  def self.token(secret = "")
  	@@trusendr_token = secret
  end

  # Configure default email options

  # def headers_for(action, opts)
  #   headers = {
  #     subject: subject_for(action),
  #     to: resource.email,
  #     from: mailer_sender(devise_mapping),
  #     reply_to: mailer_reply_to(devise_mapping),
  #     template_path: template_paths,
  #     template_name: action
  #   }.merge(opts)

  #   @email = headers[:to]
  #   headers
  # end  
end


module Devise
  module Mailers
    module Helpers
      include ActionView::Helpers
      # include Devise::Mailers::Helpers

      protected

      attr_reader :scope_name, :resource

      # Configure default email options
      def devise_mail(record, action, opts = {}, &block)
        initialize_from_record(record)
        headers = headers_for(action, opts)
        opts.merge!({email: record.email})
        host, port = ActionMailer::Base.default_url_options.values_at :host, :port
        http_method = Rails.application.config.force_ssl ? 'https' : 'http'

        case headers[:template_name].to_s
        when "confirmation_instructions"
          confirmation_url = "#{http_method}://#{host}:#{port}/#{record.class.to_s.downcase}/confirmation?confirmation_token="+record.confirmation_token
          opts.merge!({confirmation_url:  confirmation_url })
        when "reset_password_instructions"
          edit_password_url = "#{http_method}://#{host}:#{port}/#{record.class.to_s.downcase}/password/edit?reset_password_token="+record.reset_password_token

          opts.merge!({edit_password_url: edit_password_url })
        when "unlock_instructions"
          unlock_url = "#{http_method}://#{host}:#{port}/#{record.class.to_s.downcase}/unlock?unlock_token="+record.unlock_token

          opts.merge!({unlock_url: unlock_url })
        when "email_changed"
          if resource.try(:unconfirmed_email?)
            opts.merge!({unconfirmed_email: resource.unconfirmed_email})
          end
        when "password_change"
          # opts.merge!({})
        end
        puts "Successfully delivered email."
        TruSender::send_email(DeviseTruSender::get_ts_token, headers[:template_name], headers[:to], opts)
      end

    end
  end
end
