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

class RequestSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :purpose_classroom_id, :type_classroom_id, :external_person_id, :state, :request_alternative_id
  
  belongs_to :teacher
  belongs_to :purpose_classroom
  belongs_to :type_classroom
  belongs_to :external_person
  
end
