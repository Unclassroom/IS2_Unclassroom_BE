class ClassroomSchedule < ApplicationRecord
  ## validates

  ## associations
  belongs_to :classroom
  belongs_to :group
  belongs_to :cyclic_schedule
  has_many :opinion
end
