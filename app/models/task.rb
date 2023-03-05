class Task < ApplicationRecord
  belongs_to :course

  validates :description, length: { maximum: 255 }
  validates :task_note, length: { maximum: 3 }
  validates :limit_note, presence: true
end
