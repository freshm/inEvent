require "omniauth-facebook"
require "omniauth-twitter"
require "omniauth-google-oauth2"

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.sign_out_via = :delete

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.omniauth :google_oauth2, "429917625641-aapm41j6hoe3ojm2vvvcmukgcfc4pl26.apps.googleusercontent.com", "gPTlqbKzAm9NIVtjWdfuxefM"
  config.omniauth :facebook, "778021768918425", "51448714ad8087300b735254c377e446"
  config.omniauth :twitter, "c4ap73W60bssEpJldjd0BW46K", "GSrFHCkcIGv4A9CM6cXnKsFkdxMRyJdVNvh9yAl2PsxUuwPzXi"
end
