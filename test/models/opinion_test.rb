# == Schema Information
#
# Table name: opinions
#
#  id                    :integer          not null, primary key
#  classroom_schedule_id :integer
#  opinable_type         :string
#  opinable_id           :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  description           :string
#  classroom_id          :integer
#  image                 :string
#
# Indexes
#
#  index_opinions_on_classroom_id                   (classroom_id)
#  index_opinions_on_classroom_schedule_id          (classroom_schedule_id)
#  index_opinions_on_opinable_type_and_opinable_id  (opinable_type,opinable_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (classroom_schedule_id => classroom_schedules.id)
#

require 'test_helper'

class OpinionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
