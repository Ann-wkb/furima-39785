class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      # @items = includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
      end
       redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:item_title, :item_description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
