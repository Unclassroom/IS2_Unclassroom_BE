# == Schema Information
#
# Table name: pets
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
end
