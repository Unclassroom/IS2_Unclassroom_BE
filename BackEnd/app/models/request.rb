class Request < ApplicationRecord
  belongs_to :teacher
  belongs_to :purpose_classroom
  belongs_to :type_classroom
  belongs_to :external_person
end
