class Classroom < ApplicationRecord
  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :building_id, presence: true, numericality: { only_integer: true }
  validates :department_id, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }


  belongs_to :type_classroom
  belongs_to :building
  belongs_to :department
  has_many :classroom_schedules
  has_many :cyclic_schedules, through: :classroom_schedules
  has_many :cyclic_requests, through: :cyclic_schedules
  has_many :opinios, through: :classroom_schedules
  has_many :classroom_events
  has_many :specific_schedules, through: :classroom_events
  has_many :specific_requests, through: :specific_schedules
end
