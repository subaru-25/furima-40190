class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      # 商品画像はActive Storageを利用
      t.string :item_name # 商品名
      t.text :item_info # 商品の説明

      t.integer :category_id # カテゴリー
      t.integer :condition_id # 商品の状態

      t.integer :shipping_fee_burden_id # 配送料の負担
      t.integer :prefecture_id # 発送元の地域
      t.integer :shipping_time_id # 発送までの日数

      t.integer :item_price # 価格
      t.timestamps
    end
  end
end
