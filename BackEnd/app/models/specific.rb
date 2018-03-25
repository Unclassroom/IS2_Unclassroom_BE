class Specific < ApplicationRecord
    validates :date, presence: true
    validates :begin_at, presence: true
    validates :end_at, presence: true
    
end
