class SpecificRequest < ApplicationRecord
  ## validates

  ## associations
  belongs_to :request_alternative
  belongs_to :specific
end
