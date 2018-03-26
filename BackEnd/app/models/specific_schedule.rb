class SpecificSchedule < ApplicationRecord
    validates :date, presence: true
    validates :begin_at, presence: true
    validates :end_at, presence: true

    has_many :specific_requests
    has_many :request_alternatives, through: :specific_requests
    has_many :classroom_events
    has_many :classrooms, through: :classroom_events
end
