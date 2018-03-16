class Faculty < ApplicationRecord
<<<<<<< HEAD
=======
    ##validates
    validates :name, presence: { message: "must be given please" }, uniqueness: true, length: 
    { maximum: 60, too_long: "%{count} characters is the maximum allowed" }
    
    #associations
    has_many :buildings
    has_many :department
>>>>>>> 4323bbc9048eb9ed3727712ee66f05525c9b5586
end
