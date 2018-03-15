class ClassroomSchedule < ApplicationRecord
  belongs_to :classroom
  belongs_to :group
  belongs_to :cyclic_schedule
end
