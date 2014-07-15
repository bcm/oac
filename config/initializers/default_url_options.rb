# required in order to use Rails.application.routes.url_helpers outside of a controller
Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options
