class Classroom < ApplicationRecord
  belongs_to :type_classroom
  belongs_to :purpose_classroom
  belongs_to :building
  belongs_to :deparment
  has_many :schema
  has_many :report
end
