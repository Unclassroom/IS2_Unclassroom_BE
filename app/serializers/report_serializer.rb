# == Schema Information
#
# Table name: reports
#
#  id              :integer          not null, primary key
#  description     :string(500)
#  classroom_id    :integer
#  reportable_type :string
#  reportable_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image           :string
#
# Indexes
#
#  index_reports_on_classroom_id                       (classroom_id)
#  index_reports_on_reportable_type_and_reportable_id  (reportable_type,reportable_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#

class ReportSerializer < ActiveModel::Serializer
  attributes :id, :description, :classroom_id, :type, :reportable

  def type
    object.reportable_type
  end

  belongs_to :classroom
end
