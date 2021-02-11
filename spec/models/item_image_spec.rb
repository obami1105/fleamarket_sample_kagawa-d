require 'rails_helper'
describe ItemImage do
  describe '#create' do
    before do
      @item_image = build(:item_image)
    end

    # item
    it "itemが存在しないと登録できないこと" do
      @item_image.item = nil
      @item_image.valid?
      expect(@item_image.errors[:item]).to include("を入力してください")
    end

    # image_url
    it "image_urlが空では登録できないこと" do
      @item_image.image_url = nil
      @item_image.valid?
      expect(@item_image.errors[:image_url]).to include("を入力してください")
    end

  end
end