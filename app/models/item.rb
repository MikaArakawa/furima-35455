class Item < ApplicationRecord

  with_options presence: true do
    validates :title,                   length: { maximum: 40 }
    validates :description,             length: { maximum: 1000 } 
    validates :price,                   format: {with: /\A[0-9]+\z/}, numericality: { in: 300..9999999 }
    validates :status_id             
    validates :category_id           
    validates :shipping_charge_id      
    validates :prefecture_id         
    validates :shipping_date_id        
    validates :image
  end

  has_one :purchased_item, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_one_attached :image

end
