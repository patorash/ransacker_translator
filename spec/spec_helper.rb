require 'active_record'
require 'active_support'
require 'database_cleaner'
require 'ransack'
require 'ransacker_translator'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :suite do
    database_name = 'ransacker_translator'
    pg_host = ENV.fetch('POSTGRES_HOST', 'localhost')
    pg_port = ENV.fetch('POSTGRES_PORT', 5432)
    pg_user = ENV.fetch('POSTGRES_USER', 'postgres')
    pg_pass = ENV.fetch('POSTGRES_PASSWORD', 'password')
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: pg_host,
      username: pg_user,
      password: pg_pass,
      database: 'postgres',
      port: pg_port,
    )
    ActiveRecord::Base.connection.execute("DROP DATABASE IF EXISTS #{database_name}")
    ActiveRecord::Base.connection.execute("CREATE DATABASE #{database_name}")
    ActiveRecord::Base.connection_pool.disconnect!
    ActiveRecord::Base.establish_connection(
      adapter: 'postgresql',
      host: pg_host,
      username: pg_user,
      password: pg_pass,
      database: database_name,
      port: pg_port,
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