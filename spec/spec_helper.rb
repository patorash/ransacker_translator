require 'bundler'

Bundler.require :default, :development

# If you're using all parts of Rails:
Combustion.initialize! :active_record, :action_controller, :action_view
require 'active_support'
ActiveSupport::Dependencies.autoload_paths << '../lib'

require 'ransack'

require 'rspec/rails'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :suite do
    DatabaseCleaner.strategy = :truncation
  end
  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end
end