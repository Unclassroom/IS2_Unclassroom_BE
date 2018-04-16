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
#  motive                 :text
#  file                   :string
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
  attributes :id, :state, :times, :purpose_classroom, :type_classroom, :motive
  has_one :purpose_classroom
  has_one :type_classroom
  has_one :teacher
  belongs_to :teacher
  
  def times
    if object.request_alternatives.exists?
      object.request_alternatives.first.specific_schedules.select('specific_schedules.*')
    else
      -1
    end
  end
  def purpose_classroom
    PurposeClassroom.find(object.purpose_classroom_id).name
  end
  def type_classroom
    TypeClassroom.find(object.type_classroom_id).name
  end
end
