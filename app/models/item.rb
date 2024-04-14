class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :shipping_time

  has_one_attached :image
  validates :image, presence: true# 商品画像はActive Storageを利用
  validates :item_name, presence: true # 商品名
  validates :item_info, presence: true # 商品の説明
  validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: "半角数値のみ使用可能です" } # 価格
  validates :shipping_fee_burden_id, numericality: { other_than: 1 , message: "can't be blank"}  # 配送料の負担
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}  # カテゴリー
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}  # 商品の状態
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}  # 発送元の地域
  validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank"}  # 発送までの日数
end