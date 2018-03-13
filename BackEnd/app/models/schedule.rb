class Schedule < ApplicationRecord
  belongs_to :time_zone
  belongs_to :day
  has_many :schema
end
