require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー登録機能' do
    context '内容に問題がない場合' do
      it "全てが正常の場合" do
        expect(@user).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
  

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it 'last_nameが全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameが全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end

      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank", "First name reading is invalid")
      end

      it 'last_name_readingが全角カナ文字でないと登録できない' do
        @user.last_name_reading = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end

      it 'first_name_readingが全角カナ文字でないと登録できない' do
        @user.first_name_reading = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12aa5'
        @user.password_confirmation = '12aa5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字でなければ登録できない(半角英字のみ)' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英数字でなければ登録できない(半角数字のみ)' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英字でなければ登録できない' do
        @user.password = 'ＡＡＡＡ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email ='test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end