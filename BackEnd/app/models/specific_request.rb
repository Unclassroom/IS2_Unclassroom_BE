class SpecificRequest < ApplicationRecord
  validates :request_alternative_id, presence: true, numericality: { only_integer: true }
  validates :specific_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :request_alternative
  belongs_to :specific
end
