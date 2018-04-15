# == Schema Information
#
# Table name: cyclic_schedules
#
#  id         :integer          not null, primary key
#  day        :integer
#  begin_at   :time
#  end_at     :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CyclicScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
