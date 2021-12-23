require 'test_helper'

class RansackerTranslatorControllerModuleTest < ActionController::TestCase
  test '半角スペース区切りの文字列が配列に変換されていること' do
    @controller = DummyController.new
    hash = {
      q: { title_translate_cont_any: 'パーフェクトRuby みんなのGo言語 プログラミングTypeScript' }
    }
    mock_params = ActionController::Parameters.new(hash)
    expected_hash = {
      'q' => { 'title_translate_cont_any' => %w(パーフェクトRuby みんなのGo言語 プログラミングTypeScript) }
    }
    @controller.stub(:params, mock_params) do
      @controller.send(:format_ransack_params)
      assert_equal(expected_hash, @controller.params.to_unsafe_h)
    end
  end
end

class DummyController < ActionController::Base
  include RansackerTranslator::FormatRansackParameters
end