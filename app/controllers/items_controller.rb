class ItemsController < ApplicationController
  def index
    #@items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to @item
  end
end

private

def item_params
  params.require(:item).permit(:description, :category, :condition, :shipping_fee_status, :prefecture, :scheduled_delivery, :price)
end
