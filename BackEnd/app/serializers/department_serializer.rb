# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  faculty_id :integer
#  name       :string
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_departments_on_faculty_id  (faculty_id)
#  index_departments_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (faculty_id => faculties.id)
#  fk_rails_...  (teacher_id => teachers.id)
#

class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :faculty_id, :name, :teacher_id

  belongs_to :faculty
  belongs_to :teacher
  
end
