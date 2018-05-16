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

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
