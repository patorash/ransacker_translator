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
    # system('dropdb --host=localhost --port=5432 --username=postgres --if-exists ransacker_translator', exception: true)
    # system('createdb --owner=postgres --host=localhost --port=5432 --username=postgres ransacker_translator', exception: true)
    database_name = 'ransacker_translator'
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: 'localhost',
      username: 'postgres',
      database: 'postgres',
      port: 5432,
    )
    ActiveRecord::Base.connection.execute("DROP DATABASE IF EXISTS #{database_name}")
    ActiveRecord::Base.connection.execute("CREATE DATABASE #{database_name}")
    ActiveRecord::Base.connection_pool.disconnect!
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: 'localhost',
      username: 'postgres',
      database: database_name,
      port: 5432,
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