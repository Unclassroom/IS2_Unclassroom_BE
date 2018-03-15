class Group < ApplicationRecord
  #validates
  


  #associations
  belongs_to :subject
  has_many :classroom_schedules
end
