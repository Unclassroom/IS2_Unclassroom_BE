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
#
# Indexes
#
#  index_classroom_schedules_on_classroom_id        (classroom_id)
#  index_classroom_schedules_on_cyclic_schedule_id  (cyclic_schedule_id)
#  index_classroom_schedules_on_group_id            (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (cyclic_schedule_id => cyclic_schedules.id)
#  fk_rails_...  (group_id => groups.id)
#

class ClassroomSchedule < ApplicationRecord
  include ActiveModel::Serialization

  validates :classroom_id, presence: true, numericality: { only_integer: true }
  validates :group_id, presence: true, numericality: { only_integer: true }
  validates :cyclic_schedule_id, presence: true, numericality: { only_integer: true }


  belongs_to :classroom
  belongs_to :group
  belongs_to :cyclic_schedule
  has_many :opinions
end
