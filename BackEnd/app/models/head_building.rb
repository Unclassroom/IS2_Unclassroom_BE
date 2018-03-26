# == Schema Information
#
# Table name: head_buildings
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HeadBuilding < ApplicationRecord
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    
    has_one :building
    has_many :classrooms, through: :building
end
