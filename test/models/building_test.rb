# == Schema Information
#
# Table name: buildings
#
#  id               :integer          not null, primary key
#  name             :string
#  head_building_id :integer
#  faculty_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  number           :integer
#
# Indexes
#
#  index_buildings_on_faculty_id        (faculty_id)
#  index_buildings_on_head_building_id  (head_building_id)
#
# Foreign Keys
#
#  fk_rails_...  (faculty_id => faculties.id)
#  fk_rails_...  (head_building_id => head_buildings.id)
#

require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
