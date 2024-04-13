class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true
  validates :shipping_fee_burden, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :prefecture, presence: true
  validates :shipping_time, presence: true
end