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

class SpecificScheduleSerializer < ActiveModel::Serializer
  attributes :id, :date, :begin_at, :end_at
end
