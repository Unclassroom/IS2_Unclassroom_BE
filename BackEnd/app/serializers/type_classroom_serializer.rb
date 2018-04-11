# == Schema Information
#
# Table name: type_classrooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypeClassroomSerializer < ActiveModel::Serializer
  attributes :id
end
