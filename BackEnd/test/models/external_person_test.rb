# == Schema Information
#
# Table name: external_people
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExternalPersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
