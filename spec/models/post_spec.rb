require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '投稿の保存' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '投稿がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@post).to be_valid
      end
    end
  end
end
