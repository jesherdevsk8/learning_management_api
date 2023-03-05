class Task < ApplicationRecord
  belongs_to :course

  validates :description, length: { minimum: 255 }
  validates :task_note, length: { minimum: 3 }
  validates :limit_note, presence: true
end
