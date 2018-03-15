class Teacher < ApplicationRecord
    ## validates

    ## associations
    has_many :requests
    has_many :departments
end
