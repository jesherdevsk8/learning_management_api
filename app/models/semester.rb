class Semester < ApplicationRecord
  has_many :courses

  validates :current_semester, presence: true, length: { maximum: 8 }
  validates :current_semester_code, length: { maximum: 2 }
  validates :description, length: { maximum: 255 }
end
