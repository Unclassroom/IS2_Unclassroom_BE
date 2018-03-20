class Department < ApplicationRecord
  validates :teacher_id, presence: true, numericality: { only_integer: true }
  validates :faculty_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true,


  belongs_to :faculty
  belongs_to :teacher
end
