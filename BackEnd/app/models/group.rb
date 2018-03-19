class Group < ApplicationRecord
  belongs_to :subject
  has_many :classroom_schedules
end
