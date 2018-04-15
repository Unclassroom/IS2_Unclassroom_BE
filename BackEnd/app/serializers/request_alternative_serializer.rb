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

class RequestAlternativeSerializer < ActiveModel::Serializer
  attributes :id, :request_id
  #belongs_to :requests
  has_many :specific_requests
end
