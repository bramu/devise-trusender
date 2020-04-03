module Devise
  module Mailers
    module Helpers

      # Configure default email options
      def devise_mail(record, action, opts = {}, &block)
        initialize_from_record(record)
        headers = headers_for(action, opts)
        TruSender.send_email(DevisePlugTrusender::get_secret_token, headers[:template_name], headers[:to], opts)
      end

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
  end
end