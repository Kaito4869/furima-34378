require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email, passwordとpassword_confirmation, family_name, first_name, family_name_kana, first_name_kana, birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下であれば登録できる' do
        @user.nickname = 'Kaito'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で、英数字の組み合わせであれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'first_nameが全角であれば登録できる' do
        @user.first_name = '太郎'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'family_nameが全角であれば登録できる' do
        @user.family_name = '田中'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角カタカナであれば登録できる' do
        @user.family_name_kana = 'タナカ'
        @user.valid?
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'Mizumoto'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
      end
      it '姓に全角(漢字・ひらがな・カタカナ)以外は登録できない' do
        @user.family_name = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it '名に全角(漢字・ひらがな・カタカナ)以外は登録できない' do
        @user.first_name = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '姓(フリガナ)に全角(漢字・ひらがな・カタカナ)以外は登録できない' do
        @user.family_name_kana = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '名(フリガナ)に全角(漢字・ひらがな・カタカナ)以外は登録できない' do
        @user.first_name_kana = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がない場合は登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",'Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英字のみの場合は登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",'Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは全角英数字混合では登録できない' do
        @user.password = 'bcd１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordとpassword_confirmationが一致していない場合は登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc321'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
