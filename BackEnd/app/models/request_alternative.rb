class RequestAlternative < ApplicationRecord
  ## validates
  validates :request_alternative, presence: true, numericality: { only_integer: true }

  ## associations
  belongs_to :request
  has_many :cyclic_requests
  has_many :specific_requests
end
