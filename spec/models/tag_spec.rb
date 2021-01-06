require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'タグネームの保存' do
    before do
      @tag = FactoryBot.build(:tag)
    end

    context '投稿がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@tag).to be_valid
      end
    end
  end
end
