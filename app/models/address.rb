class Address < ApplicationRecord
  with_options presence: true do
    # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} 不要のため削除
    # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"} 不要のため削除
    validates :city
    validates :address
    validates :building
    validates :phone
  end

  def save
    order = Order.create(price: price, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building,
                   phone: phone, order_id: order.id)
  end

  belongs_to :order
end
