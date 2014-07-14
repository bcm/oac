require 'database_cleaner'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

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
end
