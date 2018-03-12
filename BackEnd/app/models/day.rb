class Day < ApplicationRecord
  has_many :schedule_request
  has_many :schedule
end
