class Student < ApplicationRecord
  has_many :courses

  validates :name, :email, :password, presence: true, length: { minimum: 255 }
end
