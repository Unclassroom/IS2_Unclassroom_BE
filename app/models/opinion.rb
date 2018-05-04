# == Schema Information
#
# Table name: opinions
#
#  id                    :integer          not null, primary key
#  classroom_schedule_id :integer
#  student_id            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  description           :string
#  classroom_id          :integer
#  image                 :string
#
# Indexes
#
#  index_opinions_on_classroom_id           (classroom_id)
#  index_opinions_on_classroom_schedule_id  (classroom_schedule_id)
#  index_opinions_on_student_id             (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (classroom_schedule_id => classroom_schedules.id)
#  fk_rails_...  (student_id => students.id)
#

class Opinion < ApplicationRecord
  mount_uploader :image, ImageUploader
    
  # validates :student_id, presence: true, numericality: { only_integer: true }
  validates :classroom_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  belongs_to :student
  belongs_to :classroom

  #Make the query in classroom and classroom request and classroom schedule and classroom event
end
