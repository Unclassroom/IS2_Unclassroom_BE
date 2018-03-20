class Teacher < ApplicationRecord
    ## validates
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    
    ## associations
    has_many :requests
    has_many :departments
end
