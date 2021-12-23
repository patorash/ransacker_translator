require 'test_helper'

class RansackerTranslatorHelperTest < ActionView::TestCase
  test '#ransack_params_array_to_s' do
    hash = {
      q: { name: %w(山田 佐藤 田中) }
    }
    mock_params = ActionController::Parameters.new(hash)
    self.stub(:params, mock_params) do
      assert_equal(
        '山田 佐藤 田中',
        ransack_params_array_to_s(:name)
      )
    end
    assert_equal('', ransack_params_array_to_s(:no_exist_key))
  end

  test '#ransack_param_translate_normal_or_key' do
    assert_equal(
      'name_translate_or_yomigana_translate_cont_any',
      ransack_param_translate_normal_or_key(:name, :yomigana)
    )
  end

  test '#ransack_param_translate_normal_and_key' do
    assert_equal(
      'name_translate_and_yomigana_translate_cont_any',
      ransack_param_translate_normal_and_key(:name, :yomigana)
    )
  end

  test 'ransack_param_translate_ignore_key' do
    assert_equal(
      'name_translate_and_yomigana_translate_not_cont_all',
      ransack_param_translate_ignore_key(:name, :yomigana)
    )
  end
end