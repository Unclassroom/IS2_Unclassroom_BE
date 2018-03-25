class Building < ApplicationRecord
  ## validates
  validates :name, presence: true,  length: { maximum: 50 }
  validates :head_building_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
   
  ## associations
  belongs_to :faculty
  belongs_to :head_building
end
