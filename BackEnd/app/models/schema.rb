class Schema < ApplicationRecord
  belongs_to :classroom
  belongs_to :schedule
  belongs_to :subject
end
