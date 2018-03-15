class Classroom < ApplicationRecord
  belongs_to :type_classroom
  belongs_to :building
  belongs_to :deparment
end
