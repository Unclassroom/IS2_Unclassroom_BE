# == Schema Information
#
# Table name: specific_requests
#
#  id                     :integer          not null, primary key
#  request_alternative_id :integer
#  specific_schedule_id   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_specific_requests_on_request_alternative_id  (request_alternative_id)
#  index_specific_requests_on_specific_schedule_id    (specific_schedule_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_alternative_id => request_alternatives.id)
#  fk_rails_...  (specific_schedule_id => specific_schedules.id)
#

class SpecificRequestSerializer < ActiveModel::Serializer
  attributes :id, :request_alternative_id, :specific_schedule_id

  belongs_to :request_alternative
  belongs_to :specific_schedule
  
end
