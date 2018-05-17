# == Schema Information
#
# Table name: classroom_events
#
#  id                   :integer          not null, primary key
#  event_id             :integer
#  specific_schedule_id :integer
#  classroom_id         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  request_id           :integer
#
# Indexes
#
#  index_classroom_events_on_classroom_id          (classroom_id)
#  index_classroom_events_on_event_id              (event_id)
#  index_classroom_events_on_request_id            (request_id)
#  index_classroom_events_on_specific_schedule_id  (specific_schedule_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (request_id => requests.id)
#  fk_rails_...  (specific_schedule_id => specific_schedules.id)
#

class ClassroomEventSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :specific_schedule_id, :classroom_id
  
  belongs_to :event
  belongs_to :specific_schedule
  belongs_to :classroom
end
