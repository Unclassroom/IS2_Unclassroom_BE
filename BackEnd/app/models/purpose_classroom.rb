class PurposeClassroom < ApplicationRecord
    validates :name, presence: { message: "must be given please" }, uniqueness: true
end
