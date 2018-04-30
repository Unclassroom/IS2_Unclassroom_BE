# == Schema Information
#
# Table name: specific_schedules
#
#  id              :integer          not null, primary key
#  date            :date
#  begin_at        :time
#  end_at          :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  begin_at_hour   :integer
#  begin_at_minute :integer
#  end_at_hour     :integer
#  end_at_minute   :integer
#

class SpecificSchedule < ApplicationRecord
    include ActiveModel::Serialization
    validates :date, presence: true
    validates :begin_at, presence: true
    validates :end_at, presence: true

    has_many :specific_requests
    has_many :request_alternatives, through: :specific_requests
    has_many :classroom_events
    has_many :classrooms, through: :classroom_events

    # I think that it isnt necesaary make queries here.
end
