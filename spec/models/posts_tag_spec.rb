require 'rails_helper'
RSpec.describe PostsTag, type: :model do
  describe '投稿の保存' do
    before do
      @post = FactoryBot.build(:posts_tag)
    end

    context '投稿がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@post).to be_valid
      end
      it '重複したtag_nameが存在しても登録できる' do
        @post.save
        another_post = FactoryBot.build(:posts_tag)
        another_post.tag_name = @post.tag_name
        expect(@post).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'contentが空では登録できないこと' do
        @post.content = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("投稿内容を入力してください")
      end
      it 'tag_nameが空では保存できないこと' do
        @post.tag_name = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("タグを入力してください")
      end
      it 'tag_nameが16文字以上は登録できない' do
        @post.tag_name = "a" * 16
        @post.valid?
        expect(@post.errors.full_messages).to include("タグは15文字以内で入力してください")
      end
      it 'contentが10001文字以上では登録できないこと' do
        @post.content = "a" * 1001
        @post.valid?
        expect(@post.errors.full_messages).to include("投稿内容は1000文字以内で入力してください")
      end
    end
  end
end