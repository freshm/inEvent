require "omniauth-facebook"
require "omniauth-google-oauth2"

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	#provider :facebook, ENV['778021768918425'], ENV['51448714ad8087300b735254c377e446']
	#, "778021768918425", "51448714ad8087300b735254c377e446"
end