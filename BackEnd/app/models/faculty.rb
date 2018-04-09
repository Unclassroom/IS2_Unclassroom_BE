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

    # def self.get_data(hb_id)
    #     Faculty
    #     .joins(:departments, :classrooms)
    #     .where('head_buildings.id = ?',hb_id)
    #     .select('head_buildings.first_name, head_buildings.cc, buildings.name AS buildiname, faculties.name').limit(1) 
    # end
end
