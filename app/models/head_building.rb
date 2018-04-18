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
    include ActiveModel::Serialization
    mount_uploader :file, ImageUploader

    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    has_many :buildings
    has_many :faculties, through: :buildings
    has_many :departments, through: :faculties
    has_many :classrooms, through: :buildings

    def self.get_data(hb_id)
        HeadBuilding
        .joins(:departments, :faculties, :buildings)
        .where('head_buildings.id = ?',hb_id)
        .select('head_buildings.first_name, head_buildings.cc, buildings.name AS buildiname, faculties.name').limit(1) 
    end
    def self.check_user
        user_id = User.find_by id: ("#{User.current.id}")
        HeadBuilding.joins(:departments, :faculties, :buildings).where('head_buildings.id = ?', user_id).select('head_buildings.first_name, head_buildings.cc, buildings.name AS buildiname, faculties.name').limit(1) 
    end
    def self.basicInfo
        HeadBuilding.joins(:buildings).select("last_name, email")
    end
end
