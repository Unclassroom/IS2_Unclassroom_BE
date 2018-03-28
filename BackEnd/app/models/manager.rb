# == Schema Information
#
# Table name: managers
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_managers_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Manager < ApplicationRecord
    validates :cc, presence: true, numericality: { only_integer: true }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    
    belongs_to :user
end
