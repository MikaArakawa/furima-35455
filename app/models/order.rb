class Order < ApplicationRecord
  # validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "is invalid"} 不要のため削除

  belongs_to :item
  has_one :address
  belongs_to :user
end
