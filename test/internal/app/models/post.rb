class Post < ActiveRecord::Base
  include RansackerTranslator

  ransacker_translate :title, :content

  validates :title, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title_translate"]
  end
end
