class CyclicSchedule < ApplicationRecord
    validates :day, presence: true, numericality: { only_integer: true }
    validates :begin_at, presence: true
    validates :end_at, presence: true
  
    has_many :cyclic_requests
    has_many :request_alternatives, through: :cyclic_requests
    has_many :classroom_schedules
    has_many :groups, through: :classroom_schedules
    has_many :subjects, through: :groups
    has_many :classrooms, through: :classroom_schedules
end
