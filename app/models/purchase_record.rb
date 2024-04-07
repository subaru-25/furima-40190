class PurchaseRecord < ApplicationRecord
  # Associations
  belongs_to :user  
  belongs_to :item  
  has_one :shipping_address
end