class SpecificRequest < ApplicationRecord
  ## validates
  validates :request_alternative_id, presence: true, numericality: { only_integer: true }
  validates :specific_id, presence: true, numericality: { only_integer: true }
  
  ## associations
  belongs_to :request_alternative
  belongs_to :specific
end
