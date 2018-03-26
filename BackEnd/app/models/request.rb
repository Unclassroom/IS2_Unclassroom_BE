class Request < ApplicationRecord
  ## validates
  validates :teacher_id, presence: true, numericality: { only_integer: true }
  validates :external_person_id, presence: true, numericality: { only_integer: true }
  validates :purpose_classroom_id, presence: true, numericality: { only_integer: true }
  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :state, presence: true 
  
  belongs_to :teacher
  belongs_to :purpose_classroom
  belongs_to :type_classroom
  belongs_to :external_person
  has_many :request_alternatives
  has_many :cyclic_requests, through: :request_alternatives
  has_many :specific_requests, through: :request_alternatives
end
