# == Schema Information
#
# Table name: requests
#
#  id                     :integer          not null, primary key
#  teacher_id             :integer
#  purpose_classroom_id   :integer
#  type_classroom_id      :integer
#  state                  :string
#  requestable_type       :string
#  requestable_id         :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  request_alternative_id :integer
#  motive                 :text
#  file                   :string
#
# Indexes
#
#  index_requests_on_purpose_classroom_id                 (purpose_classroom_id)
#  index_requests_on_request_alternative_id               (request_alternative_id)
#  index_requests_on_requestable_type_and_requestable_id  (requestable_type,requestable_id)
#  index_requests_on_teacher_id                           (teacher_id)
#  index_requests_on_type_classroom_id                    (type_classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (purpose_classroom_id => purpose_classrooms.id)
#  fk_rails_...  (request_alternative_id => request_alternatives.id)
#  fk_rails_...  (teacher_id => teachers.id)
#  fk_rails_...  (type_classroom_id => type_classrooms.id)
#

class RequestSerializer < ActiveModel::Serializer
  attributes :id, :state, :times, :purpose_classroom, :type_classroom, :motive, :file, :user_type, :requestable
  has_one :purpose_classroom
  has_one :type_classroom
  

  def user_type
    object.requestable_type
  end
  def times
    if object.request_alternatives.exists?
      ans = Array.new
      for i in object.request_alternatives
        for j in i.specific_schedules
          ans.push(j)
        end
      end
      ans
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
