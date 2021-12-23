module RansackerTranslator
  module ViewHelpers
    module ActionView

      # paramsの指定したkeyの要素を半角スペースで繋いだ文字列にする
      #
      # @param [Symbol] key ransackで使っているキー
      # @return [String] params[:q][key]を半角スペースでつなげた文字列
      def ransack_params_array_to_s(key)
        if params[:q].present? && params[:q][key].present?
          params[:q][key].join(' ')
        else
          ''
        end
      end

      # ransacker_translatorでOR検索に使うキーを返す
      #
      # @param [Array<String>] *columns カラム名の配列
      # @return [String] ransacker_translatorでOR検索に使うキー
      def ransack_param_translate_normal_or_key(*columns)
        "#{columns.join("_translate_or_")}_translate_cont_any"
      end

      # ransacker_translatorでAND検索に使うキーを返す
      #
      # @param [Array<String>] *columns カラム名の配列
      # @return [String] ransacker_translatorでAND検索に使うキー
      def ransack_param_translate_normal_and_key(*columns)
        "#{columns.join("_translate_and_")}_translate_cont_any"
      end

      # ransacker_translatorで除外検索に使うキーを返す
      #
      # @param [Array<String>] *columns カラム名の配列
      # @return [String] ransacker_translatorで除外検索に使うキー
      def ransack_param_translate_ignore_key(*columns)
        "#{columns.join("_translate_and_")}_translate_not_cont_all"
      end

      ::ActionView::Base.send :include, self
    end
  end
end