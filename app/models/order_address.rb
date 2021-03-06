class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/ }, numericality: { only_integer: true }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building,
                   phone: phone, order_id: order.id)
  end
end
