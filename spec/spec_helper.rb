# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require "database_cleaner"
require 'capybara/rails'
require 'factory_girl_rails'
require 'factories'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }


RSpec.configure do |config| 
  
  config.before(:suite) do
    if defined?(::Debugger)
      ::Debugger.start
      if ::Debugger.respond_to?(:settings)
        ::Debugger.settings[:autoeval] = true
        ::Debugger.settings[:autolist] = true
      end
    end
  end
  
  config.use_transactional_fixtures = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  # Factory girl syntactic sugar
  config.include Factory::Syntax::Methods
end