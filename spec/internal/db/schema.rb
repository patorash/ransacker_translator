# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table(:posts, force: true) do |t|
    t.string :title, null: false, default: ''
    t.text :content, null: false, default: ''
    
    t.timestamps
  end
end
