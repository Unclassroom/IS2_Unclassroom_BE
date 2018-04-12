# == Schema Information
#
# Table name: managers
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Manager < ApplicationRecord
    include ActiveModel::Serialization
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    #belongs_to :user
# I think that it isnt necesaary make queries here.
end
