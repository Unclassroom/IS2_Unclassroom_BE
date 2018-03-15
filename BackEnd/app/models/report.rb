class Report < ApplicationRecord
  belongs_to :schedule
  belongs_to :classroom
end
