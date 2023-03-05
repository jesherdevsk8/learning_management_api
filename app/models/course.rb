class Course < ApplicationRecord
  belongs_to :instructor
  belongs_to :student
  belongs_to :semester
  belongs_to :teaching_level
  has_many   :tasks

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 255 }
end
