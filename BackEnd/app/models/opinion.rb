class Opinion < ApplicationRecord
  ## validates
  validates :student_id, presence: true, numericality: { only_integer: true }
  validates :classroom_schedule_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  ## associations
  belongs_to :student
  belongs_to :classroom_schedule
end
