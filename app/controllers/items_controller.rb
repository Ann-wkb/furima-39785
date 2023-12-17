class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def index
    @items = Item.all # すべての商品を取得する例。必要に応じて条件を追加してください。
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_title, :item_description, :user, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
