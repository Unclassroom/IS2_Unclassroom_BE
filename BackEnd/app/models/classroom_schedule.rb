class ClassroomSchedule < ApplicationRecord
  belongs_to :classroom
  belongs_to :group
  belongs_to :subject
end
