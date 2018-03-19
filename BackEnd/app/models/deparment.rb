class Deparment < ApplicationRecord
  belongs_to :faculty
  belongs_to :teacher
end
