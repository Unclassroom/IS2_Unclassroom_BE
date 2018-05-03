# == Schema Information
#
# Table name: specific_schedules
#
#  id              :integer          not null, primary key
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  begin_at_hour   :integer
#  begin_at_minute :integer
#  end_at_hour     :integer
#  end_at_minute   :integer
#

require 'test_helper'

class SpecificScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
