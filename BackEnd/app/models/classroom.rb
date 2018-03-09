class Classroom < ApplicationRecord
  belongs_to :type_classroom
  belongs_to :purpose_classroom
  belongs_to :building
  belongs_to :deparment
  belongs_to :schedule
end
