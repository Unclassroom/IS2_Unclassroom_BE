class Schedule < ApplicationRecord
  belongs_to :subject
  belongs_to :classroom
  has_many :opinion
end
