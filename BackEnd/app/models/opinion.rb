class Opinion < ApplicationRecord
  belongs_to :schema
  belongs_to :student
end
