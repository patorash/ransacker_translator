class Post < ActiveRecord::Base
  include RansackerTranslator

  ransacker_translate :title, :content

  validates :title, presence: true
end