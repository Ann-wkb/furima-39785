class OrdersController < ApplicationController
  before_action :authenticate_user!
  

  def index
    item_id = params[:item_id]
    @item = Item.find(item_id)
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def new
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
      # フォームがバリデーションを通過した場合の処理
      # 例えば、OrderForm モデルに基づいて Order レコードを作成するなど
    else
      render :index
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

