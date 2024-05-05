class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :redirect_if_sold_out_or_own_product, only: [:index]
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id]) 
    @order_form = OrderForm.new
  end

  def create 
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params.merge(user_id: current_user.id, price: @item.item_price))
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order_form.price, # 商品の値段
      card: @order_form.token, # カードトークン
      currency: 'jpy'    # 通貨の種類（日本円）
    )
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number, :token).merge(item_id: params[:item_id], token: params[:token])
  end

  def redirect_if_sold_out_or_own_product
    item = Item.find(params[:item_id])
    if (item.order.present?) || (item.user_id == current_user.id) 
      redirect_to root_path
    end
  end

end