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
  include ActiveModel::Serialization

  validates :name, presence: true,  length: { maximum: 50 }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :head_building
  belongs_to :faculty
  has_many  :classrooms
  has_many :type_classrooms, through: :classrooms
  has_many :departments, through: :faculty
  has_many  :classroom_schedules, through: :classrooms

  def self.get_classrooms(hb_id)
    Building
    .joins(:faculty, :departments, :classrooms, :type_classrooms)
    .where('buildings.id = ?',hb_id)
    .select('buildings.name AS buildname, classrooms.id AS classid, type_classrooms.name AS typename').limit(1) 
  end
  def self.check_user
    user_id = User.find_by id: ("#{User.current.id}")
    HeadBuilding.joins(:departments, :departments, :faculties, :buildings).where('head_buildings.id = ?', user_id).select('head_buildings.first_name, head_buildings.cc, buildings.name AS buildiname, faculties.name').limit(1) 
  end
end
