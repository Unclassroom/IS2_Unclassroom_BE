# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  subject_id :integer
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#

class Group < ApplicationRecord
  include ActiveModel::Serialization
  validates :subject_id, presence: true, numericality: { only_integer: true }
  validates :number, presence: true, numericality: { only_integer: true }

  belongs_to :subject
  has_many :classroom_schedules
  has_many :classrooms, through: :classroom_schedules
  has_many :cyclic_schedules, through: :classroom_schedules
  has_many :opinions, through: :classroom_schedules

  # I think that it isnt necesaary make queries here.
end
