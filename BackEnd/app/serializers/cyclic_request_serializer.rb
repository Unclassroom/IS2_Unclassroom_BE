# == Schema Information
#
# Table name: cyclic_requests
#
#  id                     :integer          not null, primary key
#  request_alternative_id :integer
#  cyclic_schedule_id     :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_cyclic_requests_on_cyclic_schedule_id      (cyclic_schedule_id)
#  index_cyclic_requests_on_request_alternative_id  (request_alternative_id)
#
# Foreign Keys
#
#  fk_rails_...  (cyclic_schedule_id => cyclic_schedules.id)
#  fk_rails_...  (request_alternative_id => request_alternatives.id)
#

class CyclicRequestSerializer < ActiveModel::Serializer
  attributes :id, :request_alternative_id, :cyclic_schedule_id

  belongs_to :request_alternative
  belongs_to :cyclic_schedule
  
end
