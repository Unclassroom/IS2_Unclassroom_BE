class Faculty < ApplicationRecord
  has_many :building
  has_many :deparment
end
