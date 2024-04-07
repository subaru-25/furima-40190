class ShippingAddress < ApplicationRecord
  # Associations
  belongs_to :purchase_record  
end