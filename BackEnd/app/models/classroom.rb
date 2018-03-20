class Classroom < ApplicationRecord
  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :building_id, presence: true, numericality: { only_integer: true }
  validates :department_id, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }


  belongs_to :type_classroom
  belongs_to :building
  belongs_to :department
  has_many :classroom_events, through => :events
  has_many :classroom_schedules, through => :schedules
  has_many :reports
end
