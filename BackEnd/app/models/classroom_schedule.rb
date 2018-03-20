class ClassroomSchedule < ApplicationRecord

  validates :classroom_id, presence: true, numericality: { only_integer: true }
  validates :group_id, presence: true, numericality: { only_integer: true }
  validates :cyclic_schedule_id, presence: true, numericality: { only_integer: true }


  belongs_to :classroom
  belongs_to :group
  belongs_to :subject
  belongs_to :cyclic_schedule
end
