class Building < ApplicationRecord
  belongs_to :head_building
  belongs_to :faculty
  has_many :classroom
end
