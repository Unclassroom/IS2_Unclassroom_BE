class Group < ApplicationRecord
  validates :subject_id, presence: true, numericality: { only_integer: true }
  validates :number, presence: true, numericality: { only_integer: true }

  belongs_to :subject
  has_many :classroom_schedules
  has_many :classrooms, through: :classroom_schedules
  has_many :cyclic_schedules, through: :classroom_schedules
  has_many :opinions, through: :classroom_schedules
end
