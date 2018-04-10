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
    
    has_many :buildings
    has_many :departments
    has_many :head_buildings, through: :buildings
    has_many :classrooms, through: :departments

# I think that it isnt necesaary make queries here.

end
