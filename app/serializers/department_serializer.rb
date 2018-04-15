# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  faculty_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_departments_on_faculty_id  (faculty_id)
#
# Foreign Keys
#
#  fk_rails_...  (faculty_id => faculties.id)
#

class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :faculty_id, :name
  has_many :teachers
  belongs_to :faculty
  

end
