class Request < ApplicationRecord
  ## validates
  validates :teacher_id, presence: true, numericality: { only_integer: true }
  validates :external_person_id, presence: true, numericality: { only_integer: true }
  validates :purpose_classroom_id, presence: true, numericality: { only_integer: true }
  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :accepted_alternative, presence: true, numericality: { only_integer: true }
  validates :state, presence: true 
  
  ## associations
  belongs_to :teacher
  belongs_to :external_person
  belongs_to :purpose_classroom
  belongs_to :type_classroom
  has_many :request_alternatives
end
