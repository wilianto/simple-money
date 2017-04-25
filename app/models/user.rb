class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :password, length: { minimum: 5 }

  has_secure_password
end
