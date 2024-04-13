class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path # 成功したらトップページにリダイレクト
    else
      render :new # 失敗したらnewアクションを再度呼び出す
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_price, :shipping_fee_burden, :category, :condition, :prefecture, :shipping_time)
  end
end