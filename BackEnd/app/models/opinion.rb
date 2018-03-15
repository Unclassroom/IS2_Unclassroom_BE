class Opinion < ApplicationRecord
  ## validates

  ## associations
  belongs_to :student
  belongs_to :classroom_schedule
end
