class Item < ApplicationRecord
  # Associations
  belongs_to :user  
  has_one :purchase_record
end