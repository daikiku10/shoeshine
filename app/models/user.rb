class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shops

  with_options presence: true do
    validates :shop_name
    validates :user_name, format: {with: /\A[ぁ-んァ-ンー-龥]/}
  end

end
