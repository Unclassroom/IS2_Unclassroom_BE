class Event < ApplicationRecord
    ## validates
    validates :name, presence: true
    validates :description, presence: true

    ## associations
    has_many :classroom_events

end
