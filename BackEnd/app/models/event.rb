class Event < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_many :classroom_events
    has_many :classrooms, through: :classroom_events

end
