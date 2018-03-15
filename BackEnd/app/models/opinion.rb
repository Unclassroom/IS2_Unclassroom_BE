class Opinion < ApplicationRecord
  belongs_to :student
  belongs_to :classroom_schedule
end
