class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    item_id = params[:item_id]
    @item = Item.find(item_id)
    @order_form = OrderForm.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def new
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
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
    params.require(:order_form).permit(:postal_code, :prefecture, :city, :street_address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

