class Shop < ApplicationRecord
  belongs_to :user
  after_validation :remove_unnecessary_error_messages

  with_options presence: true do
    validates :address, length: {maximum: 40}
    validates :instagram, length: {maximum: 30}
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
    validates :lat, presence: { message: '指定場所を地図にクリックしてください' }
    validates :lng
  end

  def remove_unnecessary_error_messages
    errors.messages.delete(:lng)
  end

end
