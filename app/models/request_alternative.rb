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

class RequestAlternative < ApplicationRecord
  include ActiveModel::Serialization
  validates :request_id, presence: true, numericality: { only_integer: true }

  belongs_to :request
  has_many :cyclic_requests
  has_many :specific_requests
  has_many :cyclic_schedules, through: :cyclic_requests
  has_many :specific_schedules, through: :specific_requests

  ## I dont know if it is necesarry, it is yes ajjaja add attributes and scopes, one for 
  ## cyclic and other for specific, or in request or both I dont know.
  def self.get_data(hb_id)
    RequestAlternative
    .joins(:request, :cyclic_requests, :specific_requests)
    .where('request_alternatives.id = ?',hb_id)
    .select('requests.id AS requestid, specific_requests.id AS specificid').limit(1) 
  end
end
