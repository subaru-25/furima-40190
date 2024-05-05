class OrderForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :block
    validates :token
  end

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は不正な値です" }
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は不正な値です" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end