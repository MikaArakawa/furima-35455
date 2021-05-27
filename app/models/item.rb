class Item < ApplicationRecord
  with_options presence: true do
    validates :title,                   length: { maximum: 40 }
    validates :description,             length: { maximum: 1000 }
    validates :price,                   format: { with: /\A[0-9]+\z/ },
                                        numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :status_id,               numericality: { other_than: 1 }
    validates :category_id,             numericality: { other_than: 1 }
    validates :shipping_charge_id,      numericality: { other_than: 1 }
    validates :prefecture_id,           numericality: { other_than: 1 }
    validates :shipping_date_id,        numericality: { other_than: 1 }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_date
  belongs_to :shipping_charge

  has_one :purchased_item, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_one_attached :image
end
