# == Schema Information
#
# Table name: purpose_classrooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PurposeClassroom < ApplicationRecord
    include ActiveModel::Serialization
    validates :name, presence: { message: "must be given please" }, uniqueness: true

    has_many :requests
    
    # I think that it isnt necesaary make queries here.
end
