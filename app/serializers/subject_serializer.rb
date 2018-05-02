# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  code       :string
#

class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name
end
