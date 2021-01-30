require 'rails_helper'
describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end

    it "nickname、email、password、password_confirmation、first_name、family_name、first_name_kana、family_name_kana、birth_dateがあれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = build(:user, email:@user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it 'emailに@が含まれていない場合登録できないこと' do
      @user.email = "aaa＠aaa.com"
      @user.valid?
      expect(@user.errors[:email]).to include("は不正な値です")
    end

    it 'emailにドメインが含まれていない場合登録できないこと' do
      @user.email = "aaa@aaa,com"
      @user.valid?
      expect(@user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字に満たないときは登録できないこと" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "first_nameがないと登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors[:first_name]).to include("を入力してください")
    end

    it "family_nameがないと登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors[:family_name]).to include("を入力してください")
    end

    it "first_name_kanaがないと登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaがないと登録できないこと" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("を入力してください")
    end

    it 'first_nameが全角でなければ登録できないこと' do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors[:first_name]).to include("は不正な値です")
    end

    it 'family_nameが全角でなければ登録できないこと' do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors[:family_name]).to include("は不正な値です")
    end

    it 'first_name_kanaが全角ひらがなでなければ登録できないこと' do
      @user.first_name_kana = "アイウエオ"
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it 'family_name_kanaが全角ひらがなでなければ登録できないこと' do
      @user.family_name_kana = "アイウエオ"
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "birth_dateがないと登録できないこと" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors[:birth_date]).to include("を入力してください")
    end

  end
end
