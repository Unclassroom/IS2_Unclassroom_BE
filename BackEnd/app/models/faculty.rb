# == Schema Information
#
# Table name: faculties
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Faculty < ApplicationRecord
    include ActiveModel::Serialization

    validates :name, presence: { message: "must be given please" }, uniqueness: true, length: 
    { maximum: 60, too_long: "%{count} characters is the maximum allowed" }
    
    has_many :Building
    has_many :Department
    has_many :HeadBuilding, through: :Building
    has_many :Classroom, through: :Department
end
