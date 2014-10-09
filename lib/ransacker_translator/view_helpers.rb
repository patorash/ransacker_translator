module RansackerTranslator
  module ViewHelpers
    def ransack_params_array_to_s(key)
      if params[:q].present? && params[:q][key].present?
        params[:q][key].join(' ')
      else
        ''
      end
    end

    def ransack_param_translate_normal_or_key(*columns)
      "#{columns.join("_translate_or_")}_translate_cont_any"
    end

    def ransack_param_translate_normal_and_key(*columns)
      "#{columns.join("_translate_and_")}_translate_cont_any"
    end

    def ransack_param_translate_ignore_key(*columns)
      "#{columns.join("_translate_and_")}_translate_not_cont_all"
    end
  end
end