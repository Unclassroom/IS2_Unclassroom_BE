# == Schema Information
#
# Table name: request_alternatives
#
#  id         :integer          not null, primary key
#  request_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_request_alternatives_on_request_id  (request_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_id => requests.id)
#

require 'test_helper'

class RequestAlternativeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
