class ScheduleRequest < ApplicationRecord
  belongs_to :request
  belongs_to :time_zone
  belongs_to :day
end
