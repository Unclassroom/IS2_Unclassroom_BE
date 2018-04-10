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

class CyclicRequest < ApplicationRecord
  include ActiveModel::Serialization

  validates :request_alternative_id, presence: true, numericality: { only_integer: true }
  validates :cyclic_schedule_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :request_alternative
  belongs_to :cyclic_schedule
 ## add scopes for just cyclic request and just for specific_request
  def self.get_data(hb_id)
    CyclicRequest
    .joins(:cyclic_schedule, :request_alternative)
    .where('cyclic_requests.id = ?',hb_id)
    .select('cyclic_schedules.day, cyclic_schedules.begin_at, cyclic_schedules.end_at').limit(1) 
  end
end
