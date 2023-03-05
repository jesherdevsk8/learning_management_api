class Student < ApplicationRecord
  has_secure_password

  has_many :courses

  validates :name, :email, :password_digest, presence: true, length: { maximum: 255 }
end
