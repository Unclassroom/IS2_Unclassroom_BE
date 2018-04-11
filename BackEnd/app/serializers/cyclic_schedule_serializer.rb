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

class CyclicScheduleSerializer < ActiveModel::Serializer
  attributes :id, :day, :begin_at, :end_at
end
