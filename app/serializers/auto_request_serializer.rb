# == Schema Information
#
# Table name: auto_requests
#
#  id         :integer          not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AutoRequestSerializer < ActiveModel::Serializer
  attributes :id, :file
end
