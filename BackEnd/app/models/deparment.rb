class Deparment < ApplicationRecord
  belongs_to :faculty
  belongs_to :teacher
  has_many :classroom
end
