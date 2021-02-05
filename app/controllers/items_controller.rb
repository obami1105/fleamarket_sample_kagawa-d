class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.build_item_image
    @categories = Category.roots
  end

  def get_category
    selected_category = Category.find(params[:category_id])
    @categories = selected_category.children
  end

  def create
    @item = Item.new(item_params)
    # respond_to do |format|
    #   format.html { redirect_to :root }
    #   format.json { render json: @todo}
    # end
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
    params.require(:item).permit(:trading_status, :name, :category_id, :introduction, :condition_id, :shipping_fee_payer_id, :prefecture_id, :preparation_day_id, :price, item_image_attributes: [:id, :image_url])
  end 

end
