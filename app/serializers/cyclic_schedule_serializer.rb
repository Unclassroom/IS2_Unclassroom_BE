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

class CyclicScheduleSerializer < ActiveModel::Serializer
  attributes :id, :day, :begin_at, :end_at
end
