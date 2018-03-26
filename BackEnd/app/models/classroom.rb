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
  has_many :opinios, through: :classroom_schedules
  has_many :classroom_events
  has_many :specific_schedules, through: :classroom_events
  has_many :specific_requests, through: :specific_schedules
end
