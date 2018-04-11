class ClassroomEventSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :specific_schedule_id, :classroom_id
  
  belongs_to :event
  belongs_to :specific_schedule
  belongs_to :classroom
end
