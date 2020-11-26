class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shops

  with_options presence: true do
    validates :user_name, format: {with: /\A[ぁ-んァ-ンー-龥]/}
  end
  validates :password, format: {with: /\A[a-zA-Z0-9]+\z/}

end
