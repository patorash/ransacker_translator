require 'minitest/autorun'
require 'active_record'
require 'active_support'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'
require 'database_cleaner'
require 'ransack'
require 'ransacker_translator'
require 'ransacker_translator/view_helpers/action_view'
require 'internal/app/models/post'

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

class ActionView::TestCase
  include RansackerTranslator::ViewHelpers::ActionView
end