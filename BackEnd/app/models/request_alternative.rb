class RequestAlternative < ApplicationRecord
  ## validates

  ## associations
  belongs_to :request
  has_many :cyclic_requests
  has_many :specific_requests
end
