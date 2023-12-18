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
    @item = Item.new(item_params)  
    if @item.save
      if params[:item][:images].present?
        @item.images.attach(params[:item][:images])
        # 画像が添付されている場合の処理
        # 例: 画像が添付されていれば何かしらの処理を行う
      end
#      if @item.image.attached?
#        # 画像が添付されている場合の処理
#        # 例: 画像が添付されていれば何かしらの処理を行う
#      end
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_title, :item_description, :user, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, :images).merge(user_id: current_user.id)
  end
end
