module RansackerTranslator
  module FormatRansackParameters
    extend ActiveSupport::Concern

    def format_ransack_params
      if params[:q].present?
        params[:q].keys.each do |key|
          if key =~ /_all\z/ || key =~ /_any\z/
            params[:q][key] = params[:q][key].split(' ') if params[:q][key].instance_of? String
          end
        end
      end
    end
  end
end