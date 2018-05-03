# == Schema Information
#
# Table name: students
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
#  index_students_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,  :email, :role, :username
  
  # belongs_to :user
  def email
    if User.joins(:students).select("users.email").where('users.id = ?', object.user_id).present?
      User.joins(:students).select("users.email").where('users.id = ?', object.user_id).first.email
    else
      -1
    end
  end

  def role
    if User.joins(:students).select("users.role").where('users.id = ?', object.user_id).present?
      User.joins(:students).select("users.role").where('users.id = ?', object.user_id).first.role
    else
      -1
    end
  end

  def username
    if User.joins(:students).select("users.username").where('users.id = ?', object.user_id).present?
      User.joins(:students).select("users.username").where('users.id = ?', object.user_id).first.username
    else
      -1
    end
  end

end
