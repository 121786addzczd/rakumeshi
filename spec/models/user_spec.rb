require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('public/images/default.jpg')
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、 passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameは15文字以下で登録できる' do
        @user.nickname = 'abcdefghijklmno'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'sa1234'
        @user.password_confirmation = 'sa1234'
        expect(@user).to be_valid
      end
      it 'self_introductionが500文字まで登録できる' do
        @user.self_introduction = 'a' * 500
        @user.valid?
        expect(@user).to be_valid
      end
      it 'imageが空でも登録できる' do
        @user.image = nil
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'nicknameが16文字以上では登録できない' do
        @user.nickname = 'a' * 16
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は15文字以内で入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに＠が無いと登録できない' do
        @user.email = 'qwertdsfhsf.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'self_introductionが501文字以上では登録できない' do
        @user.self_introduction = 'a' * 501
        @user.valid?
        expect(@user.errors.full_messages).to include("自己紹介は500文字以内で入力してください")
      end
    end
  end
end