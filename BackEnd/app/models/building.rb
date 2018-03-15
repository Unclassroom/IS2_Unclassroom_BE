class Building < ApplicationRecord
  ## validates

  ## associations
  belongs_to :faculty
  belongs_to :head_building
end
