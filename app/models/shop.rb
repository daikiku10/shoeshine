class Shop < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :address, length: {maximum: 40}
    validates :instagram, length: {maximum: 30}
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
    validates :lat
    validates :lng
  end

end
