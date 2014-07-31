require 'omniauth'

Rails.configuration.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_app_secret
end

OmniAuth.config.logger = Rails.logger
