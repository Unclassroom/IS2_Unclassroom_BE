class Classroom < ApplicationRecord
  ## validates


  ## associations
  belongs_to :type_classroom
  belongs_to :building
  belongs_to :deparment
  has_many :classroom_events, through => :events
  has_many :classroom_schedules, through => :schedules
  has_many :reports
end
