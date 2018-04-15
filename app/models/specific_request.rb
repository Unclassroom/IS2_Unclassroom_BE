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

class SpecificRequest < ApplicationRecord
  include ActiveModel::Serialization
  validates :request_alternative_id, presence: true, numericality: { only_integer: true }
  validates :specific_schedule_id, presence: true, numericality: { only_integer: true }
  
  belongs_to :request_alternative
  belongs_to :specific_schedule

  def self.get_data(hb_id)
    SpecificRequest
    .joins(:specific_schedule, :request_alternative)
    .where('specific_requests.id = ?',hb_id)
    .select('specific_schedules.date, specific_schedules.begin_at, specific_schedules.end_at').limit(1) 
  end
end
