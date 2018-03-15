class Opinion < ApplicationRecord
  belongs_to :classroom_schedule
  belongs_to :student
end
