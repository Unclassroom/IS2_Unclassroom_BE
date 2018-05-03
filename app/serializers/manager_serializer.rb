# == Schema Information
#
# Table name: managers
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
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

class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :role
  
  def email
    if User.joins(:managers).select("users.email").where('users.id = ?', object.user_id).present?
      User.joins(:managers).select("users.email").where('users.id = ?', object.user_id).first.email
    else
      -1
    end
  end
  def role
    if User.joins(:managers).select("users.role").where('users.id = ?', object.user_id).present?
      User.joins(:managers).select("users.role").where('users.id = ?', object.user_id).first.role
    else
      -1
    end
  end

end
