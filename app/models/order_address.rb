class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :price, :user_id, :phone, :item_id, :order_id

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, order_id: order.id)
  end

end