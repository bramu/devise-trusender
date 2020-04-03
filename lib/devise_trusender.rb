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
      protected

      attr_reader :scope_name, :resource

      # Configure default email options
      def devise_mail(record, action, opts = {}, &block)
        initialize_from_record(record)
        headers = headers_for(action, opts)
        puts "Successfully delivered email."
        TruSender.send_email(DeviseTruSender::get_ts_token, headers[:template_name], headers[:to], opts)
      end

    end
  end
end