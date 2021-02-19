require 'rails_helper'
describe CreditCard do
  describe '#pay' do
    before do
      @credit_card = build(:credit_card)
    end

    it "user_id, customer_id, card_idがあれば登録できること" do
      expect(@credit_card).to be_valid
    end

    it "user_idがなければ登録できないこと" do
      @credit_card.user_id = nil
      @credit_card.valid?
      expect(@credit_card).to be_invalid
    end

    it "customer_idがなければ登録できないこと" do
      @credit_card.customer_id = nil
      @credit_card.valid?
      expect(@credit_card).to be_invalid
    end

    it "card_idがなければできないこと" do
      @credit_card.card_id = nil
      @credit_card.valid?
      expect(@credit_card).to be_invalid
    end

  end
end
