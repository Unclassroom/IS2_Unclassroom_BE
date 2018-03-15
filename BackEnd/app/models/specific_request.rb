class SpecificRequest < ApplicationRecord
  belongs_to :request_alternative
  belongs_to :specific_schedule
end
