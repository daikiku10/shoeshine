class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :shop_name
    validates :instagram
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :house_number
  end
end
