class Shop < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :address
    validates :instagram
    validates :phone_number
    validates :lat
    validates :lng
  end

end
