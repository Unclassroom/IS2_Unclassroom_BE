# == Schema Information
#
# Table name: specific_requests
#
#  id                     :integer          not null, primary key
#  request_alternative_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_specific_requests_on_request_alternative_id  (request_alternative_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_alternative_id => request_alternatives.id)
#

require 'test_helper'

class SpecificRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
