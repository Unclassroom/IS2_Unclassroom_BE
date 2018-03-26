class Department < ApplicationRecord
  validates :teacher_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true

  belongs_to :faculty
  belongs_to :teacher, :foreign_key => :cc, :class_name => 'Teacher'
  has_many :classrooms
  has_many :classroom_schedules, through: :classrooms
end
