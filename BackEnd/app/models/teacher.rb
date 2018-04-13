# == Schema Information
#
# Table name: teachers
#
#  id            :integer          not null, primary key
#  cc            :integer
#  first_name    :string
#  last_name     :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  role          :string
#
# Indexes
#
#  index_teachers_on_department_id  (department_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#

class Teacher < ApplicationRecord
    include ActiveModel::Serialization
    ## validates
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :groups
    has_many :requests
    has_one :departments
    #belongs_to :user

    # I think that it isnt necesaary make queries here.
end
