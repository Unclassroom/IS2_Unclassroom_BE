class ClassroomEvent < ApplicationRecord
  belongs_to :event
  belongs_to :specific
  belongs_to :classroom
end
