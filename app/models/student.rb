# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_students_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Student < ApplicationRecord
    include ActiveModel::Serialization
    ## validates
    # validates :cc, numericality: { only_integer: true }, presence: false
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :user_id, presence: true
    
    has_many :opinions
    belongs_to :user

    # I think that it isnt necesaary make queries here.
end
