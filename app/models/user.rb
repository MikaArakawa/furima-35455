class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :email
    validates :password, length: { minimum: 6 }
    validates :nickname, length: { maximum: 40 }
    validates :surname, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
    validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} 
    validates :sei, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :mei, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
    validates :birthday
    end

    has_many :items, dependent: :destroy
    has_many :purchased_items, dependent: :destroy
end
