class CyclicRequest < ApplicationRecord
  ## validates

  ## associations
  belongs_to :request_alternative
  belongs_to :cyclic_schedule
end
