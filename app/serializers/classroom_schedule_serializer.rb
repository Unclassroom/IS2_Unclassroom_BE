# == Schema Information
#
# Table name: classroom_schedules
#
#  id                 :integer          not null, primary key
#  classroom_id       :integer
#  group_id           :integer
#  cyclic_schedule_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  request_id         :integer
#
# Indexes
#
#  index_classroom_schedules_on_classroom_id        (classroom_id)
#  index_classroom_schedules_on_cyclic_schedule_id  (cyclic_schedule_id)
#  index_classroom_schedules_on_group_id            (group_id)
#  index_classroom_schedules_on_request_id          (request_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (cyclic_schedule_id => cyclic_schedules.id)
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (request_id => requests.id)
#

class ClassroomScheduleSerializer < ActiveModel::Serializer
  attributes :id, :classroom_id, :group_id, :cyclic_schedule_id

  belongs_to :classroom
  belongs_to :cyclic_schedule
  belongs_to :group
  
end
