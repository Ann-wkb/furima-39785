class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :description, :category_id, :condition, :shipping_fee_status, :prefecture, :scheduled_delivery, :price)..merge(user_id: current_user.id)
  end
end
