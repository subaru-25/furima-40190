class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_sold, only: [:edit, :update] # 自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移

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
      unless current_user.id == @item.user_id
        redirect_to root_path
      end
    end

    def update
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        logger.debug(@item.errors.full_messages)
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      # ログイン中のユーザーが出品者である場合、商品を削除
      if current_user.id == @item.user_id
        if @item.destroy
          redirect_to root_path
        else
          render :show
        end
      else
        redirect_to root_path
      end
    end

    private

    def item_params
      params.require(:item).permit(:item_name, :item_info, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :shipping_time_id, :item_price, :image)
    end
  
    def set_item
      @item = Item.find(params[:id])
    end

    def redirect_if_sold # 自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移
      if @item.order.present?
        redirect_to root_path
      end
    end

  end