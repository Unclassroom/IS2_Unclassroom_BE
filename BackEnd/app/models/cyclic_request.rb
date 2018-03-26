class CyclicRequest < ApplicationRecord
  validates :request_alternative_id, presence: true, numericality: { only_integer: true }
  validates :cyclic_schedule_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :request_alternative
  belongs_to :cyclic_schedule
end
