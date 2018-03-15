class ClassroomEvent < ApplicationRecord
  belongs_to :event
  belongs_to :specific_schedule
  belongs_to :classroom
end
