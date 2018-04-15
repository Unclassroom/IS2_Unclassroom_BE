# == Schema Information
#
# Table name: teachers
#
#  id            :integer          not null, primary key
#  cc            :integer
#  first_name    :string
#  last_name     :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  role          :string
#
# Indexes
#
#  index_teachers_on_department_id  (department_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
