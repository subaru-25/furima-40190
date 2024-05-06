class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :load_item, only: [:index, :create, :redirect_if_sold_out_or_own_product]
  before_action :redirect_if_sold_out_or_own_product, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params) 
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

  def load_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price, # 商品の値段
      card: @order_form.token, # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number, :token).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id) 
  end

  def redirect_if_sold_out_or_own_product
    if (@item.order.present?) || (@item.user_id == current_user.id)
      redirect_to root_path
    end
  end
end