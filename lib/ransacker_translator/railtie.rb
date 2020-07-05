require 'rails/railtie'
require 'ransacker_translator/models/concerns/ransacker_translator'
require 'ransacker_translator/controllers/concerns/format_ransack_parameters'

module RansackerTranslator
  class Railtie < ::Rails::Railtie
    initializer "ransacker_translator" do
      require 'ransacker_translator/view_helpers/action_view'
    end
  end
end