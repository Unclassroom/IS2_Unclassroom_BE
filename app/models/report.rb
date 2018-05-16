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

class Report < ApplicationRecord
  include ActiveModel::Serialization
  mount_uploader :image, ImageUploader
  belongs_to :reportable, polymorphic: true
  validates :classroom_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :classroom
# Maybe this query isnt necesarry
  def self.get_data(hb_id)
    Report
    .joins(:classroom)
    .where('reports.id = ?',hb_id)
    .select('classrooms.id AS classid').limit(1) 
  end
end
