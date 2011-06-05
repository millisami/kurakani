# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require "database_cleaner"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }


RSpec.configure do |config| 
  config.use_transactional_fixtures = false

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.filter_run_excluding :exclude => true
  
  config.before(:suite) do
    # DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  
end
  # 
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  #   DatabaseCleaner.clean
  # end
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # 
  # end