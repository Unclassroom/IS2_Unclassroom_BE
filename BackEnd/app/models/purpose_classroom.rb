class PurposeClassroom < ApplicationRecord
  has_many :classroom
  has_many :request
end
