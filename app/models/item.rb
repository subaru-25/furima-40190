class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: "半角数値のみ使用可能です" }
  validates :shipping_fee_burden, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :prefecture, presence: true
  validates :shipping_time, presence: true
end