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
#  number            :integer
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

  def self.get_specific_classrooms(date, begin_hour,begin_minute, end_hour, end_minute)
  
    d1  = Time.parse(begin_hour+begin_minute)
    d2  = Time.parse(end_hour+end_minute)
    if Classroom.select("specific_schedules.date").where('specific_schedules.id = ?', object.id).present?
      Classroom.select("specific_schedules.date").where('specific_schedules.id = ?', object.id).first.date.wday
    else
      -1
    end
    instance = Classroom
    .joins(:classroom_events, :specific_schedules)
    .where('classrooms_events.classroom_id = ?',object.id)
    .where('specific_schedules.date').
    .select('classrooms.id').limit(1) 
p instance.between?( d1, d2 ) # => true
    Classroom
    .joins(:classroom_events, :specific_schedules)
    .where('classrooms_events.classroom_id = ?',object.id)
    .where('specific_schedules.date').
    .select('classrooms.id').limit(1) 
    return  Request.where("requests.created_at >= ?", begin_date).
    where("requests.created_at <= ?", end_date).group("TO_CHAR(created_at, 'Month YYYY')").count
  end

 # It is important change the where for other that search classrooms availables
end
