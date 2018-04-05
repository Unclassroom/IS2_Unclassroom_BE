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

class Department < ApplicationRecord
  validates :teacher_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true

  def self.Faculty(d_id)
    Faculty.joins(:Department).select('faculties.name').where('departments.id = ?',d_id )
  end

  belongs_to :Faculty
  belongs_to :Teacher
  has_many :Classrooms
  has_many :ClassroomSchedule, through: :Classroom


end
