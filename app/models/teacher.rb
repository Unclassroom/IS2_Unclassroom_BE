# == Schema Information
#
# Table name: teachers
#
#  id            :integer          not null, primary key
#  cc            :integer
#  first_name    :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  role          :string
#  user_id       :integer
#
# Indexes
#
#  index_teachers_on_department_id  (department_id)
#  index_teachers_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (user_id => users.id)
#

class Teacher < ApplicationRecord
    include ActiveModel::Serialization
    ## validates
    # validates :cc, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    has_many :groups
    has_many :requests
    belongs_to :departments
    belongs_to :user
    has_many :reports, as: :reportable
    has_many :opinions, as: :opinable


    # I think that it isnt necesaary make queries here.
end
