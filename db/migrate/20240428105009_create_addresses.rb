class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false #郵便番号
      t.integer :prefecture_id, null: false #都道府県
      t.string :city, null: false #市区町村
      t.string :block, null: false #番地
      t.string :building #建物名（任意）
      t.string :phone_number, null: false #電話番号
      t.references :order, null: false, foreign_key: true #orderの外部キーカラムを追加
      t.timestamps
    end
  end
end
