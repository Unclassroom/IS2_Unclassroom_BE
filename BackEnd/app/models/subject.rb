# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ApplicationRecord
    validates :name, presence: { message: "must be given please" }, length: 
    { maximum: 60, too_long: "%{count} characters is the maximum allowed" }
    
    has_many :groups
    has_many :classroom_schedules, through: :groups
end
