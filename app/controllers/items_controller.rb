class ItemsController < ApplicationController
  def index
    @items=Item.includes(:item_image).order("created_at DESC").limit(10)
  end
  def show
  end 
  def purchase
  end
end
