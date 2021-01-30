class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_item_image
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  
  def show
  end

  private
  def item_params
    params.require(:item)
    .permit(:trading_status, :name, :introduction, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id, :preparation_day_id, :price, item_image_attributes:[ :image_url])
  end 

end
