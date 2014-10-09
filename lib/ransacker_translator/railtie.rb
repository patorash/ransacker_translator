require 'rails/railtie'
require 'ransacker_translator/models/concerns/ransacker_translator'
require 'ransacker_translator/view_helpers'

module RansackerTranslator
  class Railtie < ::Rails::Railtie
    initializer "ransacker_translator.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end