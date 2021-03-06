class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    with_options presence: true do
      validates :nickname
      validates :birth_day
    end

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,50}+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }

    with_options presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/ } do
      validates :first_name_reading
      validates :last_name_reading
    end

    with_options presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :first_name
      validates :last_name
    end

    has_many :products
    has_many :purchases
    
end

