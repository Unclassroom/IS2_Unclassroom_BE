class Report < ApplicationRecord
  validates :classroom_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true


  belongs_to :classroom
end
