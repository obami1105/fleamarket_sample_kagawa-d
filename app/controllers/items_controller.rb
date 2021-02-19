class ItemsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, only: [:new, :create, :destroy, :purchase]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase, :buy]
  before_action :set_card, only: [:purchase,:buy]

  def index
    @items=Item.includes(:item_image).order("created_at DESC").limit(10)
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
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      @categories = Category.roots
      render :new
    end
  end

  def edit
    @item=Item.includes(:item_image).find(params[:id])
  end

  def update
    @item=Item.includes(:item_image).find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      @categories = Category.roots
      redirect_to edit_item_path(@item.id)
    end
  end
  
  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item)
    end
  end

  def show
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def purchase
    if current_user.id == @item.user_id
      redirect_to item_path(@item.id)
    else
      @address = Destination.find(current_user[:id])
      @post_code = @address.post_code
      @full_address = @address.prefecture.name + @address.city + @address.house_number
      @user = User.find(current_user[:id])
      @user_fullname = @user.family_name + ' ' + @user.first_name
      unless @card.blank?
        Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @card_info = customer.cards.retrieve(@card.card_id)
        @card_num = "**** **** **** " + @card_info.last4
        @exp_month = @card_info.exp_month.to_s
        @exp_year = @card_info.exp_year.to_s.slice(2, 3)
        @card_brand = @card_info.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.svg"
        when "MasterCard"
          @card_src = "master.svg"
        when "JCB"
          @card_src = "jcb.svg"
        when "American Express"
          @card_src = "american_express.svg"
        when "Diners Club"
          @card_src = "dinersclub.svg"
        when "Discover"
          @card_src = "discover.svg"
        end
      end
    end
  end

def buy
  card = CreditCard.where(user_id: current_user.id).first
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
  Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  if @item.update(trading_status: 1)
    redirect_to action: :done
  end
end

def done
end

  private

  def set_item
    @item = Item.find_by_id(params[:id])
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:trading_status, :name, :category_id, :introduction, :condition_id, :shipping_fee_payer_id, :prefecture_id, :preparation_day_id, :price, item_image_attributes: [:id, :image_url]).merge(user_id: current_user.id)
  end

end
