class Building < ApplicationRecord
  validates :name, presence: true,  length: { maximum: 50 }
  validates :head_building_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :head_building
  belongs_to :faculty
  has_many :classrooms
  has_many :classroom_schedules, through: :classrooms
end
