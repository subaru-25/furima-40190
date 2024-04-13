class Item < ApplicationRecord
  has_one_attached :item_image
  validates :item_name, presence: true
  validates :item_price, presence: true
  validates :shipping_fee_burden, presence: true
end
