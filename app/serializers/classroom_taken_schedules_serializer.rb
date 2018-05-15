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

class ClassroomTakenSchedulesSerializer < ActiveModel::Serializer
  attributes :id, :type_classroom_id, :building_id, :department_id, :capacity, :taken_schedules

  def taken_schedules
    Classroom.where('classrooms.id = ?', object.id).joins(:classroom_schedules).joins(:cyclic_schedules)
    .select("day, begin_at_hour, begin_at_minute, end_at_hour, end_at_minute")
  end
#  begin_at_hour   :integer
#  begin_at_minute :integer
#  end_at_hour     :integer
#  end_at_minute   :integer

  #Classroom.where('classrooms.id = ?', 1).joins(:classroom_schedules).joins(:cyclic_schedules)
  
end
