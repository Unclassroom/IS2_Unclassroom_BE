# == Schema Information
#
# Table name: buildings
#
#  id               :integer          not null, primary key
#  name             :string
#  head_building_id :integer
#  faculty_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_buildings_on_faculty_id        (faculty_id)
#  index_buildings_on_head_building_id  (head_building_id)
#
# Foreign Keys
#
#  fk_rails_...  (faculty_id => faculties.id)
#  fk_rails_...  (head_building_id => head_buildings.id)
#

class Building < ApplicationRecord
  validates :name, presence: true,  length: { maximum: 50 }
  validates :head_building_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :head_building
  belongs_to :faculty
  has_many :classrooms
  has_many :classroom_schedules, through: :classrooms
end
