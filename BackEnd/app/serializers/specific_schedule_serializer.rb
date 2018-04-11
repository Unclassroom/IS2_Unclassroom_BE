# == Schema Information
#
# Table name: specific_schedules
#
#  id         :integer          not null, primary key
#  date       :date
#  begin_at   :time
#  end_at     :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpecificScheduleSerializer < ActiveModel::Serializer
  attributes :id, :date, :begin_at, :end_at
end
