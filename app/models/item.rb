class Item < ApplicationRecord

  with_options presence: true do
    validates :title,                   length: { maximum: 40 }
    validates :description,             length: { maximum: 1000 } 
    validates :price,                   format: {with: /\A[0-9]+\z/}
    validates :status_id                         
    validates :category_id           
    validates :shipping_charge_id      
    validates :prefecture_id         
    validates :shipping_date_id        
    validates :image
  end

  validates_inclusion_of :price, in:300..9999999 
  validates :prefecture_id, :status_id, :category_id,:shipping_date_id, :shipping_charge_id, numericality: { other_than: 1 } 

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
