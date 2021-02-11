require 'rails_helper'
describe Item do
  describe '#create' do
    before do
      @item = build(:item)
    end
    
    # 全体
    it "必須項目が全て存在すれば登録できること" do
      expect(@item).to be_valid
    end

    # user
    it "userが存在しないと登録できないこと" do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include("must exist")
    end

    # trading_status
    it "trading_statusが空では登録できないこと" do
      @item.trading_status = nil
      @item.valid?
      expect(@item.errors[:trading_status]).to include("can't be blank")
    end

    # name
    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end
    
    # nameは40文字以下
    it "nameが40文字を超えると登録できないこと" do
      @item.name = "a" * 41
      @item.valid?
      expect(@item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    
    it "nameが40文字以下なら登録できる" do
      @item.name = "a" * 40
      expect(@item).to be_valid
    end

    # introduction
    it "introductionが空では登録できないこと" do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors[:introduction]).to include("can't be blank")
    end

    # introductionは1000文字以下
    it "introductionが1000文字を超えると登録できないこと" do
      @item.introduction = "a" * 1001
      @item.valid?
      expect(@item.errors[:introduction]).to include("is too long (maximum is 1000 characters)")
    end

    it "introductionが1000文字以下なら登録できる" do
      @item.introduction = "a" * 1000
      expect(@item).to be_valid
    end

    # condition_id
    it "condition_idが空では登録できないこと" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end
    
    # condition_idの範囲{ in: 1..6 }
    it "condition_idが1未満は登録できないこと" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors[:condition_id]).to include("is not included in the list")
    end

    it "condition_idが6を超えると登録できないこと" do
      @item.condition_id = 7
      @item.valid?
      expect(@item.errors[:condition_id]).to include("is not included in the list")
    end

    it "condition_idが6は登録できること" do
      @item.condition_id = 6
      expect(@item).to be_valid
    end

    # condition_idは数字
    it "condition_idが文字列では登録できないこと" do
      @item.condition_id = "６"
      @item.valid?
      expect(@item.errors[:condition_id]).to include("is not included in the list")
    end

    # category
    it "categoryが存在しないと登録できないこと" do
      @item.category = nil
      @item.valid?
      expect(@item.errors[:category]).to include("must exist")
    end

    # it "categoryが1~733以外の数字は登録できないこと" do
    #   @item.category = "734"
    #   @item.valid?
    #   expect(@item.errors[:category]).to include("must exist")
    # end

    # shipping_fee_payer_id
    it "shipping_fee_payer_idが空では登録できないこと" do
      @item.shipping_fee_payer_id = nil
      @item.valid?
      expect(@item.errors[:shipping_fee_payer_id]).to include("can't be blank")
    end

    # shipping_fee_payer_idの範囲{ in: 1..2 }
    it "shipping_fee_payer _idが1未満は登録できないこと" do
      @item.shipping_fee_payer_id = 0
      @item.valid?
      expect(@item.errors[:shipping_fee_payer_id]).to include("is not included in the list")
    end

    it "shipping_fee_payer_idが2を超えると登録できないこと" do
      @item.shipping_fee_payer_id = 3
      @item.valid?
      expect(@item.errors[:shipping_fee_payer_id]).to include("is not included in the list")
    end

    it "shipping_fee_payer_idが2は登録できること" do
      @item.shipping_fee_payer_id = 2
      expect(@item).to be_valid
    end

    # shipping_fee_payer_idは数字
    it "shipping_fee_payer_idが文字列では登録できないこと" do
      @item.shipping_fee_payer_id = "２"
      @item.valid?
      expect(@item.errors[:shipping_fee_payer_id]).to include("is not included in the list")
    end

    # prefecture_id
    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("can't be blank")
    end

    # prefecture_idの範囲{ in: 1..47 }
    it "prefecture_idが1未満は登録できないこと" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("is not included in the list")
    end

    it "prefecture_idが47を超えると登録できないこと" do
      @item.prefecture_id = 48
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("is not included in the list")
    end

    it "prefecture_idが47は登録できること" do
      @item.prefecture_id = 47
      expect(@item).to be_valid
    end

    # prefecture_idは数字
    it "prefecture_idが文字列では登録できないこと" do
      @item.prefecture_id = "４７"
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include("is not included in the list")
    end
    
    # preparation_day_id
    it "preparation_day_idが空では登録できないこと" do
      @item.preparation_day_id = nil
      @item.valid?
      expect(@item.errors[:preparation_day_id]).to include("can't be blank")
    end

    # preparation_day_idの範囲{ in: 1..3 }
    it "preparation_day_idが1未満は登録できないこと" do
      @item.preparation_day_id = 0
      @item.valid?
      expect(@item.errors[:preparation_day_id]).to include("is not included in the list")
    end

    it "preparation_day_idが3を超えると登録できないこと" do
      @item.preparation_day_id = 4
      @item.valid?
      expect(@item.errors[:preparation_day_id]).to include("is not included in the list")
    end

    it "preparation_day_idが3は登録できること" do
      @item.preparation_day_id = 3
      expect(@item).to be_valid
    end

    # preparation_day_idは数字
    it "preparation_day_idが文字列では登録できないこと" do
      @item.preparation_day_id = "３"
      @item.valid?
      expect(@item.errors[:preparation_day_id]).to include("is not included in the list")
    end
    
    # price
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    # priceの範囲{ in: 300..9999999 }の範囲
    it "priceが300未満は登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include("is not included in the list")
    end

    it "priceが9999999を超えると登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors[:price]).to include("is not included in the list")
    end

    it "priceが9999999は登録できること" do
      @item.price = 9999999
      expect(@item).to be_valid
    end

    # priceは数字
    it "priceが文字列では登録できないこと" do
      @item.price = "９９９９９９９"
      @item.valid?
      expect(@item.errors[:price]).to include("is not included in the list")
    end

    # item_image
    it "item_imageが空では登録できないこと" do
      @item.item_image = nil
      @item.valid?
      expect(@item.errors[:item_image]).to include("can't be blank")
    end

  end
end