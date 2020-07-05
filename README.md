# ransacker_translator

[![CircleCI](https://circleci.com/gh/patorash/ransacker_translator.svg?style=svg)](https://circleci.com/gh/patorash/ransacker_translator)

ransacker_translatorは、ransackを使った検索で半角全角カナ、半角全角英数字、アルファベットの大文字小文字で関係なく検索できるようにするためのgemです。
マルチバイト圏に住んでいる我々のために作りました。

## インストール

Gemfileに以下を追加します。:

    gem 'ransacker_translator'

そして以下を実行しましょう。:

    $ bundle install

もしくは、以下のようにしてgemを入れましょう。:

    $ gem install ransacker_translator

## 使い方

### Model

ransacker_translatorをmodelでincludeします。
すると、ransacker_translateメソッドが使えるようになります。

    # == Schema Information
    #
    # Table name: posts
    #
    #  id                     :integer          not null, primary key
    #  title                  :string(255)      not null
    #  content                :text
    #
    class Post < ActiveRecord::Base
      include RansackerTranslator
      
      ransacker_translate :title, :content
      
    end

### Controller

ApplicationControllerでは、FormatRansackParametersをincludeします。

    class ApplicationController < ActionController::Base
      include RansackerTranslator::FormatRansackParameters
      
      # 半角スペース区切りの文字列を配列に変換します
      before_action :format_ransack_params
    end

PostsControllerはいつもの通りにしましょう。

    class PostsController < ApplicationController
      
      def index
        @q = Post.search(params[:q])
      end
      
    end

### View

app/views/posts/index.html.erbは以下のようになります。

    <%= search_form_for @q do |f| %>
      <%= f.text_field ransack_param_translate_normal_or_key(:title, :content),
            # 配列になっているパラメータを半角スペース区切りの文字列に戻します
            value: ransack_params_array_to_s(ransack_param_translate_normal_or_key(:title, :content)) %>
      <%= f.submit "Search" %>
    <% end %>



## Contributing

1. Fork it ( https://github.com/patorash/ransacker_translator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
