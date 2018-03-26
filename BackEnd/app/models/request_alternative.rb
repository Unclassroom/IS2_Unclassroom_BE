class RequestAlternative < ApplicationRecord
  validates :request_id, presence: true, numericality: { only_integer: true }

  belongs_to :request
  has_many :cyclic_requests
  has_many :specific_requests
end
