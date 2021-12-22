require_relative '../internal/app/models/post'

RSpec.describe Post do
  describe 'タイトルに' do
    # context '半角カタカナが含まれる場合' do
    #   before do
    #     Post.create!(title: 'ｶﾋﾟﾊﾞﾗ')
    #   end

    #   it '半角カタカナで検索してヒットすること' do
    #     expect(Post.ransack({ title_translate_cont_any: 'ｶﾋﾟﾊﾞﾗ' }).result).to be_exists
    #   end
    #   it '全角カタカナで検索してヒットすること' do
    #     expect(Post.ransack({ title_translate_cont_any: 'カピバラ' }).result).to be_exists        
    #   end
    # end

    context '全角カタカナが含まれる場合' do
      before do
        described_class.create!(title: 'カピバラさん')
      end

      it '半角カタカナで検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: 'ｶﾋﾟﾊﾞﾗ' }).result).to be_exists
      end
      it '全角カタカナで検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: 'カピバラ' }).result).to be_exists
      end
    end

    context '半角数字が含まれる場合' do
      before do
        described_class.create!(title: '銀河鉄道999')
      end
      it '半角数字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '999' }).result).to be_exists
      end
      it '全角数字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '９９９' }).result).to be_exists
      end
    end
      
    context '全角数字が含まれる場合' do
      before do
        described_class.create!(title: '銀河鉄道９９９')
      end
      it '半角数字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '999' }).result).to be_exists
      end
      it '全角数字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '９９９' }).result).to be_exists
      end
    end
      
    context '半角英字が含まれる場合' do
      before do
        described_class.create!(title: 'プログラマのためのDockerの教科書')
      end
      it '半角英字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: 'Docker' }).result).to be_exists
      end
      it '全角英字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: 'Ｄｏｃｋｅｒ' }).result).to be_exists
      end
    end
      
    context '全角英字が含まれる場合' do
      before do
        described_class.create!(title: 'プログラマのためのＤｏｃｋｅｒの教科書')
      end
      it '半角英字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: 'Docker' }).result).to be_exists
      end
      it '全角英字で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: 'Ｄｏｃｋｅｒ' }).result).to be_exists
      end
    end
      
    context '半角記号が含まれる場合' do
      before do
        described_class.create!(title: '集まれ!動物の森')
      end
      it '半角記号で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '集まれ!' }).result).to be_exists
      end
      it '全角記号で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '集まれ！' }).result).to be_exists
      end
    end
      
    context '全角記号が含まれる場合' do
      before do
        described_class.create!(title: '集まれ！動物の森')
      end
      it '半角記号で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '集まれ!' }).result).to be_exists
      end
      it '全角記号で検索してヒットすること' do
        expect(described_class.ransack({ title_translate_cont_any: '集まれ！' }).result).to be_exists
      end
    end
  end
end