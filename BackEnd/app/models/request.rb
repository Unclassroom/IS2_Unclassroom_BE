class Request < ApplicationRecord
  ## validates

  ## associations
  belongs_to :teacher
  belongs_to :external_person
  belongs_to :purpose_classroom
  belongs_to :type_classroom
  has_many :request_alternatives
end
