class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]  

  def index
    @items = Item.order(created_at: :desc) 
  end

  def new
    @item = Item.new
  end

   def show 
     @item = Item.find(params[:id])
   end

    def create
      @item = Item.new(item_params)
      @item.user = current_user 
      if @item.save
        redirect_to root_path # 成功したらトップページにリダイレクト
      else
        render :new, status: :unprocessable_entity # 失敗したらnewアクションを再度呼び出す
      end
    end

    def edit
      @item = Item.find(params[:id])
      unless current_user.id == @item.user_id
        redirect_to root_path
      end
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(@item) # 編集が完了したら該当商品の詳細ページに遷移
      else
        logger.debug(@item.errors.full_messages)
        render :edit, status: :unprocessable_entity # 編集に失敗したら、再度編集画面を表示
      end
    end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_time_id, :item_price, :image)
  end
end