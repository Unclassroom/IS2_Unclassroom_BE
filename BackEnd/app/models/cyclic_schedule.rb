class CyclicSchedule < ApplicationRecord
    ## validates
    validates :day, presence: true, numericality: { only_integer: true }
    validates :begin_at, presence: true
    validates :end_at, presence: true
  
    ## associations
    has_many :classroom_schedules
    has_many :cyclic_requests
end
