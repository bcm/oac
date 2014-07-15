require 'omniauth'

Rails.configuration.middleware.use OmniAuth::Builder do
  provider :developer
end

OmniAuth.config.logger = Rails.logger
