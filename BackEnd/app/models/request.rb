# == Schema Information
#
# Table name: requests
#
#  id                     :integer          not null, primary key
#  teacher_id             :integer
#  purpose_classroom_id   :integer
#  type_classroom_id      :integer
#  external_person_id     :integer
#  state                  :string
#  request_date           :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  request_alternative_id :integer
#
# Indexes
#
#  index_requests_on_external_person_id      (external_person_id)
#  index_requests_on_purpose_classroom_id    (purpose_classroom_id)
#  index_requests_on_request_alternative_id  (request_alternative_id)
#  index_requests_on_teacher_id              (teacher_id)
#  index_requests_on_type_classroom_id       (type_classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (external_person_id => external_people.id)
#  fk_rails_...  (purpose_classroom_id => purpose_classrooms.id)
#  fk_rails_...  (request_alternative_id => request_alternatives.id)
#  fk_rails_...  (teacher_id => teachers.id)
#  fk_rails_...  (type_classroom_id => type_classrooms.id)
#

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
