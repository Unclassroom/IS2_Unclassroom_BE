# == Schema Information
#
# Table name: external_people
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExternalPerson < ApplicationRecord
    include ActiveModel::Serialization

    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :reports, as: :reportable
    has_many :opinions, as: :opinable

    has_many :requests

    # I think that it isnt necesaary make queries here.
end
