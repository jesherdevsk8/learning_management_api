class Semester < ApplicationRecord
  has_many :courses

  validates :current_semester, presence: true, length: { minimum: 8 }
  validates :current_semester_code, length: { minimum: 2 }
  validates :description, length: { minimum: 255 }
end
