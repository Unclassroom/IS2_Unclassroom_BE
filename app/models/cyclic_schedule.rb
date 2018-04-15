# == Schema Information
#
# Table name: cyclic_schedules
#
#  id         :integer          not null, primary key
#  day        :integer
#  begin_at   :time
#  end_at     :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CyclicSchedule < ApplicationRecord
    include ActiveModel::Serialization

    validates :day, presence: true, numericality: { only_integer: true }
    validates :begin_at, presence: true
    validates :end_at, presence: true
  
    has_many :cyclic_requests
    has_many :request_alternatives, through: :cyclic_requests
    has_many :classroom_schedules
    has_many :groups, through: :classroom_schedules
    has_many :subjects, through: :groups
    has_many :classrooms, through: :classroom_schedules
    
    # Change function for other more important
    def self.get_data(hb_id)
        CyclicSchedule
        .joins(:cyclic_requests, :request_alternatives)
        .where('cyclic_schedules.id = ?',hb_id)
        .select('cyclic_schedules.day, cyclic_schedules.begin_at, cyclic_schedules.end_at, cyclic_requests.id AS idrequest').limit(1) 
    end
end
