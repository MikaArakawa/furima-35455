class Item < ApplicationRecord

  has_one :purchased_item, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
