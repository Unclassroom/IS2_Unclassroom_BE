# == Schema Information
#
# Table name: teachers
#
#  id            :integer          not null, primary key
#  cc            :integer
#  first_name    :string
#  last_name     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#  role          :string
#  user_id       :integer
#
# Indexes
#
#  index_teachers_on_department_id  (department_id)
#  index_teachers_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (user_id => users.id)
#

class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :email
  has_one :departments
  belongs_to :departments
  def email
    if User.joins(:teachers).select("users.email").where('users.id = ?', object.user_id).present?
      User.joins(:teachers).select("users.email").where('users.id = ?', object.user_id).first.email
    else
      -1
    end
  end
  def role
    if User.joins(:teachers).select("users.role").where('users.id = ?', object.user_id).present?
      User.joins(:teachers).select("users.role").where('users.id = ?', object.user_id).first.role
    else
      -1
    end
  end
end
