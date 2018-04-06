# == Schema Information
#
# Table name: head_buildings
#
#  id          :integer          not null, primary key
#  cc          :integer
#  first_name  :string
#  last_name   :string
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  building_id :integer
#
# Indexes
#
#  index_head_buildings_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#

class HeadBuilding < ApplicationRecord
    include ActiveModel::Serialization
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :building_id, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    def self.Faculty(hb_id)
        Faculty.joins(:Department, :Building, :HeadBuilding).where('head_buildings.id = ?',hb_id).select('faculties.*').limit(1) 
    end
    def self.Department(hb_id)
        Faculty.joins(:Department, :Building, :HeadBuilding).where('head_buildings.id = ?',hb_id).select('faculties.*').limit(1) 
    end
    def self.Building(hb_id)
        Faculty.joins(:Department, :Building, :HeadBuilding).where('head_buildings.id = ?',hb_id).select('faculties.*').limit(1) 
    end
    

    belongs_to :Building
    has_many :Faculty, through: :Building
    has_many :Classrooms, through: :Building

    

end
