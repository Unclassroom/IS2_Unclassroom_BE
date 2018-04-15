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
#  file       :string
#


class HeadBuildingSerializer < ActiveModel::Serializer
  attributes :id, :cc, :first_name, :last_name, :email, :buildingname, :buildingid, :facultyid, :facultyname
  # has_one :buildings
  def buildingid
    if HeadBuilding.joins(:buildings).select("buildings.id").where('head_buildings.id = ?', object.id).present?
      HeadBuilding.joins(:buildings).select("buildings.id").where('head_buildings.id = ?', object.id).first.id
    else
      -1
    end
    
  end
  def buildingname
    if HeadBuilding.joins(:buildings).select("buildings.name").where('head_buildings.id = ?', object.id).present?
      HeadBuilding.joins(:buildings).select("buildings.name").where('head_buildings.id = ?', object.id).first.name
    else
      -1
    end
    
  end

  def facultyname
    if HeadBuilding.joins(:faculties).select("faculties.name").where('head_buildings.id = ?', object.id).present?
      HeadBuilding.joins(:faculties).select("faculties.name").where('head_buildings.id = ?', object.id).first.name
    else
      -1
    end
    
  end

  def facultyid
    if HeadBuilding.joins(:faculties).select("faculties.id").where('head_buildings.id = ?', object.id).present?
      HeadBuilding.joins(:faculties).select("faculties.id").where('head_buildings.id = ?', object.id).first.id
    else
      -1
    end
    
  end


end


class HeadBuildingSerializer2 < HeadBuildingSerializer
  attributes :id, :cc, :first_name, :last_name, :email
end
