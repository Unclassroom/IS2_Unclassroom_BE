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

class GroupSerializer < ActiveModel::Serializer
  attributes :id, :subject_id, :number, :teacher_id
  belongs_to :teacher
  belongs_to :subject
end
