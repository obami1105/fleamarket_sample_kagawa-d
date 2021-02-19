require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe '#create' do
    before do
      @sns = build(:sns_credential)
    end
  
    context "正常に保存できる場合" do
      it "provider,uidが存在すれば登録できること" do
        expect(@sns).to be_valid
      end
    end

    context "正常に保存できない場合" do
      it "providerが空だと登録できないこと" do
        @sns.provider = nil
        @sns.valid?
        expect(@sns.errors.full_messages).to include()
      end

      it "uidが空だと登録できないこと" do
        @sns.uid = nil
        @sns.valid?
        expect(@sns.errors.full_messages).to include()
      end
    end
  end

end
