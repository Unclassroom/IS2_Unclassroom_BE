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

class Report < ApplicationRecord
  include ActiveModel::Serialization
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
