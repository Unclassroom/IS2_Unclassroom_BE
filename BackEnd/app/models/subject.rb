class Subject < ApplicationRecord
    # validates
    validates :name, presence: { message: "must be given please" }, uniqueness: true, length: 
    { maximum: 60, too_long: "%{count} characters is the maximum allowed" }

    #asociations
    has_many :group
end
