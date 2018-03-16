class CyclicSchedule < ApplicationRecord
    ## validates

    ## associations
    has_many :classroom_schedules
    has_many :cyclic_requests
end
