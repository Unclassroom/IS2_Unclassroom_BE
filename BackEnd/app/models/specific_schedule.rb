class SpecificSchedule < ApplicationRecord
    ## validates
    validates :day, presence: true
    validates :begin_at, presence: true
    validates :end_at, presence: true
    ## associations
    has_many :classroom_events
    has_many :specific_requests

end
