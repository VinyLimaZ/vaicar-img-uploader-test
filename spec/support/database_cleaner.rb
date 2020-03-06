# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.allow_production = false
    DatabaseCleaner.allow_remote_database_url = true
    DatabaseCleaner.url_whitelist = ['postgresql://postgres:@0.0.0.0:5432/myapp_test']
    DatabaseCleaner.clean_with(:truncation)
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
