class ClassroomEvent < ApplicationRecord
  validates :event_id, presence: true, numericality: { only_integer: true }
  validates :specific_id, presence: true, numericality: { only_integer: true }
  validates :classroom_id, presence: true, numericality: { only_integer: true }

  belongs_to :event
  belongs_to :specific
  belongs_to :classroom
end
