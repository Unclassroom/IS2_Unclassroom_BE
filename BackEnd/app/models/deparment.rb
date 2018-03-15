class Deparment < ApplicationRecord
    ## validates


    ## associations
    belongs_to :faculty
    has_many :classrooms
end
