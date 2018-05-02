# == Schema Information
#
# Table name: auto_request_faileds
#
#  id              :integer          not null, primary key
#  auto_request_id :integer
#  code            :string
#  group           :string
#  day             :string
#  time            :string
#  building        :string
#  classroom       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_auto_request_faileds_on_auto_request_id  (auto_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (auto_request_id => auto_requests.id)
#

class AutoRequestFailed < ApplicationRecord
  belongs_to :auto_request
end
