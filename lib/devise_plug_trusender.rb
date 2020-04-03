require "devise_plug_trusender/version"

module DevisePlugTrusender
  class Error < StandardError; end

  def self.get_secret_token
	return @@trusendr_token  	
  end

  def self.token(secret = "")
  	@@trusendr_token = secret
  end
end