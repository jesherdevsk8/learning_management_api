class TeachingLevel < ApplicationRecord
  has_many :courses

  validates :codigo, presence: true, length: { maximum: 5 }
end
