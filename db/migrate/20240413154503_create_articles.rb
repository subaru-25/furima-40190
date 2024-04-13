class CreateArticles < ActiveRecord::Migration[7.0]
  # ActiveHashのマイグレーションファイル
  def change
    create_table :articles do |t|
      t.integer    :category_id    , null: false
      t.integer    :condition_id    , null: false
      t.integer    :shipping_fee_burden_id    , null: false
      t.integer    :prefecture_id    , null: false
      t.integer    :shipping_time_id    , null: false
      t.timestamps
    end
  end
end

