require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module OacTripCalendar
  class Application < Rails::Application
    config.email = Hashie::Mash.new(
      to: Hashie::Mash.new(
        help: 'bcm@maz.org'
      )
    )
  end
end
