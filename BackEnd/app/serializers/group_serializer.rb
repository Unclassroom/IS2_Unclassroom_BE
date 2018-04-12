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

class GroupSerializer < ActiveModel::Serializer
  attributes :id, :subject_id, :number
  
  belongs_to :subject
end
