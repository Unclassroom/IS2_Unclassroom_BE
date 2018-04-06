# == Schema Information
#
# Table name: type_classrooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypeClassroom < ApplicationRecord
    include ActiveModel::Serialization
    validates :name, presence: { message: "must be given please" }, uniqueness: true

    has_many :classrooms
end
