# == Schema Information
#
# Table name: opinions
#
#  id                    :integer          not null, primary key
#  classroom_schedule_id :integer
#  student_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_opinions_on_classroom_schedule_id  (classroom_schedule_id)
#  index_opinions_on_student_id             (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_schedule_id => classroom_schedules.id)
#  fk_rails_...  (student_id => students.id)
#

require 'test_helper'

class OpinionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
