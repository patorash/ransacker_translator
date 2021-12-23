require 'test_helper'

describe 'Post' do
  before do
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  describe 'タイトルに' do
    # describe '半角カタカナが含まれる場合' do
    #   before do
    #     Post.create!(title: 'ｶﾋﾟﾊﾞﾗ')
    #   end

    #   it '半角カタカナで検索してヒットすること' do
    #     expect(Post.ransack({ title_translate_cont_any: 'ｶﾋﾟﾊﾞﾗ' }).result).must_be :exists?
    #   end
    #   it '全角カタカナで検索してヒットすること' do
    #     expect(Post.ransack({ title_translate_cont_any: 'カピバラ' }).result).must_be :exists?
    #   end
    # end

    describe '全角カタカナが含まれる場合' do
      before do
        Post.create!(title: 'カピバラさん')
      end

      it '半角カタカナで検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: 'ｶﾋﾟﾊﾞﾗ' }).result).must_be :exists?
      end
      it '全角カタカナで検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: 'カピバラ' }).result).must_be :exists?
      end
    end

    describe '半角数字が含まれる場合' do
      before do
        Post.create!(title: '銀河鉄道999')
      end
      it '半角数字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '999' }).result).must_be :exists?
      end
      it '全角数字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '９９９' }).result).must_be :exists?
      end
    end

    describe '全角数字が含まれる場合' do
      before do
        Post.create!(title: '銀河鉄道９９９')
      end
      it '半角数字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '999' }).result).must_be :exists?
      end
      it '全角数字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '９９９' }).result).must_be :exists?
      end
    end

    describe '半角英字が含まれる場合' do
      before do
        Post.create!(title: 'プログラマのためのDockerの教科書')
      end
      it '半角英字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: 'Docker' }).result).must_be :exists?
      end
      it '全角英字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: 'Ｄｏｃｋｅｒ' }).result).must_be :exists?
      end
    end

    describe '全角英字が含まれる場合' do
      before do
        Post.create!(title: 'プログラマのためのＤｏｃｋｅｒの教科書')
      end
      it '半角英字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: 'Docker' }).result).must_be :exists?
      end
      it '全角英字で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: 'Ｄｏｃｋｅｒ' }).result).must_be :exists?
      end
    end

    describe '半角記号が含まれる場合' do
      before do
        Post.create!(title: '集まれ!動物の森')
      end
      it '半角記号で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '集まれ!' }).result).must_be :exists?
      end
      it '全角記号で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '集まれ！' }).result).must_be :exists?
      end
    end

    describe '全角記号が含まれる場合' do
      before do
        Post.create!(title: '集まれ！動物の森')
      end
      it '半角記号で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '集まれ!' }).result).must_be :exists?
      end
      it '全角記号で検索してヒットすること' do
        expect(Post.ransack({ title_translate_cont_any: '集まれ！' }).result).must_be :exists?
      end
    end
  end
end