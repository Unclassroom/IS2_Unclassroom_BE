class Subject < ApplicationRecord
    # validates
    validates :name, presence: { message: "must be given please" }, length: 
    { maximum: 60, too_long: "%{count} characters is the maximum allowed" }

    #asociations
    has_many :groups
end
