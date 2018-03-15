class SpecificSchedule < ApplicationRecord
    ## validates

    ## associations
    has_many :classroom_events
    has_many :specific_requests

end
