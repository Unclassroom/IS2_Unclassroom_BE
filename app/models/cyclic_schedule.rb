# == Schema Information
#
# Table name: cyclic_schedules
#
#  id              :integer          not null, primary key
#  day             :integer
#  begin_at        :time
#  end_at          :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  begin_at_hour   :integer
#  begin_at_minute :integer
#  end_at_hour     :integer
#  end_at_minute   :integer
#

class CyclicSchedule < ApplicationRecord
    include ActiveModel::Serialization

    validates :day, presence: true, numericality: { only_integer: true }
    validates :begin_at_hour, presence: true, numericality: { only_integer: true }
    validates :end_at_hour, presence: true, numericality: { only_integer: true }
    validates :begin_at_minute, presence: true, numericality: { only_integer: true }
    validates :end_at_minute, presence: true, numericality: { only_integer: true }
  
    has_and_belongs_to_many :cyclic_requests
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

    def self.available_classrooms(day, b_h, b_m, e_h, e_m)
        ans = Array.new
        Classroom.find_each do |c|
            if c.is_cyclic_available(day, b_h, b_m, e_h, e_m)
                ans.push(c)
            end
          end
          return ans
    end
end
