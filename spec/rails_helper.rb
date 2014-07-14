ENV["RAILS_ENV"] = 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    if example.metadata[:js]
      Capybara.current_driver = :selenium
      DatabaseCleaner.strategy = :truncation
    elsif example.metadata[:after_commit]
      # these tests need to not run within a transaction in order to allow after_commit callbacks to fire or to
      # let transactions with row locks commit
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end
  end

  config.after(:each) do
    ActionMailer::Base.deliveries.clear
    Capybara.use_default_driver if example.metadata[:js]
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
end
