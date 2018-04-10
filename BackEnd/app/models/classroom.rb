# == Schema Information
#
# Table name: classrooms
#
#  id                :integer          not null, primary key
#  type_classroom_id :integer
#  building_id       :integer
#  department_id     :integer
#  capacity          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_classrooms_on_building_id        (building_id)
#  index_classrooms_on_department_id      (department_id)
#  index_classrooms_on_type_classroom_id  (type_classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (type_classroom_id => type_classrooms.id)
#

class Classroom < ApplicationRecord
  include ActiveModel::Serialization

  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :building_id, presence: true, numericality: { only_integer: true }
  validates :department_id, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }

  belongs_to :type_classroom
  belongs_to :building
  belongs_to :department
  has_many :classroom_schedules
  has_many :cyclic_schedules, through: :classroom_schedules
  has_many :cyclic_requests, through: :cyclic_schedules
  has_many :opinions, through: :classroom_schedules
  has_many :classroom_events
  has_many :specific_schedules, through: :classroom_events
  has_many :specific_requests, through: :specific_schedules

  # add query for opinion, not in opinion, because I think that it is no necesaary
  def self.get_data(hb_id)
    Classroom
    .joins(:type_classroom)
    .where('classrooms.id = ?',hb_id)
    .select('type_classrooms.name').limit(1) 
  end
 # It is important change the where for other that search classrooms availables
end
