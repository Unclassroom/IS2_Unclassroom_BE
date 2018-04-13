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

class Department < ApplicationRecord
  # validates :teacher_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true

  belongs_to :faculty
  has_many :teachers
  has_many :classrooms
  has_many :classroom_schedule, through: :classrooms


end
