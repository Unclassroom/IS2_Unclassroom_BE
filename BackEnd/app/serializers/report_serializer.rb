# == Schema Information
#
# Table name: reports
#
#  id           :integer          not null, primary key
#  description  :string(500)
#  classroom_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_reports_on_classroom_id  (classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#

class ReportSerializer < ActiveModel::Serializer
  attributes :id, :description, :classroom_id

  belongs_to :classroom
end
