require 'omniauth'

Rails.configuration.middleware.use OmniAuth::Builder do
  # XXX: not happy to ignore state, but I keep getting csrf exceptions and can't figure out why
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_app_secret,
    provider_ignores_state: true
end

OmniAuth.config.logger = Rails.logger
