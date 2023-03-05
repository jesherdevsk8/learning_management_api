class TeachingLevel < ApplicationRecord
  has_many :courses

  validates :codigo, presence: true, length: { minimum: 5 }
end
