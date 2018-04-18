# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  subject_id :integer
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :integer
#
# Indexes
#
#  index_groups_on_subject_id  (subject_id)
#  index_groups_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#  fk_rails_...  (teacher_id => teachers.id)
#

class Group < ApplicationRecord
  include ActiveModel::Serialization
  validates :subject_id, presence: true, numericality: { only_integer: true }
  validates :number, presence: true, numericality: { only_integer: true }

  belongs_to :subject
  belongs_to :teacher
  has_many :classroom_schedules
  has_many :classrooms, through: :classroom_schedules
  has_many :cyclic_schedules, through: :classroom_schedules
  has_many :opinions, through: :classroom_schedules

  # I think that it isnt necesaary make queries here.
end
