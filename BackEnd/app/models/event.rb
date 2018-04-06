# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string(200)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
    include ActiveModel::Serialization

    validates :name, presence: true
    validates :description, presence: true

    has_many :classroom_events
    has_many :classrooms, through: :classroom_events

end
