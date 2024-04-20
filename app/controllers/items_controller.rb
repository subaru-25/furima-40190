class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 

  def index
    @items = Item.order(created_at: :desc) 
  end

  def new
    @item = Item.new
  end

  # def show 商品一覧機能実装時に差分として出力するため
  #   @item = Item.find(params[:id])
  #   end

    def create
      @item = Item.new(item_params)
      @item.user = current_user 
      if @item.save
        redirect_to root_path # 成功したらトップページにリダイレクト
      else
        render :new, status: :unprocessable_entity # 失敗したらnewアクションを再度呼び出す
      end
    end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_time_id, :item_price)
  end
end