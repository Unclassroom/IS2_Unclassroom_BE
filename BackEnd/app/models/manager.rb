class Manager < ApplicationRecord
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    
end
