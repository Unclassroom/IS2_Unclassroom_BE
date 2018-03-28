# == Schema Information
#
# Table name: head_buildings
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_head_buildings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class HeadBuildingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
