class OrderForm
  include ActiveModel::Model

  attr_accessor :price, :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id

  validates :price, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は不正な値です" }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は不正な値です" }

  def save
    if valid?
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
    else
      false
    end
  end
end