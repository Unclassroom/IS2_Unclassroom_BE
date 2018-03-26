class Opinion < ApplicationRecord
  validates :student_id, presence: true, numericality: { only_integer: true }
  validates :classroom_schedule_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :student
  belongs_to :classroom_schedule
end
