require 'bundler'

Bundler.require :default, :development

require 'active_record'
require 'ransack'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :suite do
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: 'localhost',
      username: 'postgres',
      database: 'ransacker_translator',
    )

    ActiveRecord::Schema.define do
      create_table(:posts, force: true) do |t|
        t.string :title, null: false, default: ''
        t.text :content, null: false, default: ''

        t.timestamps
      end
    end

    DatabaseCleaner.strategy = :truncation
  end
  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end
end