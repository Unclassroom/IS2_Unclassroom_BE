class PurposeClassroom < ApplicationRecord
<<<<<<< HEAD
=======
    ## validates
    validates :name, presence: { message: "must be given please" }, uniqueness: true

    ## associations
    has_many :requests
>>>>>>> 4323bbc9048eb9ed3727712ee66f05525c9b5586
end
