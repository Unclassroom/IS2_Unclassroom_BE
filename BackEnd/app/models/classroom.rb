class Classroom < ApplicationRecord
  ## validates


  ## associations
  belongs_to :type_classroom
  belongs_to :building
  belongs_to :deparment
  has_many :classroom_events
  has_many :classroom_schedules
  has_many :reports
end
