# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string(200)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
