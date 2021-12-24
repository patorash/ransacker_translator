require 'active_support'

module RansackerTranslator
  module FormatRansackParameters
    extend ActiveSupport::Concern

    private

      def format_ransack_params
        params[:q]&.keys&.each do |key|
          if key.end_with?('_all', '_any') && params.dig(:q, key).instance_of?(String)
            params[:q][key] = params.dig(:q, key).split(' ')
          end
        end
      end
  end
end