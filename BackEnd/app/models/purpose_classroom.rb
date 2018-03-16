class PurposeClassroom < ApplicationRecord
    ## validates
    validates :name, presence: { message: "must be given please" }, uniqueness: true

    ## associations
    has_many :requests
end
