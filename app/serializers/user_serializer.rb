# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string
#  role            :string           default("user"), not null
#  last_login      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :role, :last_login, :first_name, :last_name
  
  # has_one :students
  def first_name
    case 
    when User.joins(:students).select("students.first_name").where('students.user_id = ?', object.id).present?
      User.joins(:students).select("students.first_name").where('students.user_id = ?', object.id).first.first_name
    when User.joins(:teachers).select("teachers.first_name").where('teachers.user_id = ?', object.id).present?
      User.joins(:teachers).select("teachers.first_name").where('teachers.user_id = ?', object.id).first.first_name
    when User.joins(:managers).select("managers.first_name").where('managers.user_id = ?', object.id).present?
      User.joins(:managers).select("managers.first_name").where('managers.user_id = ?', object.id).first.first_name
    else
      -1
    end
  end
  def last_name
    case 
    when User.joins(:students).select("students.last_name").where('students.user_id = ?', object.id).present?
      User.joins(:students).select("students.last_name").where('students.user_id = ?', object.id).first.last_name
    when User.joins(:teachers).select("teachers.last_name").where('teachers.user_id = ?', object.id).present?
      User.joins(:teachers).select("teachers.last_name").where('teachers.user_id = ?', object.id).first.last_name
    when User.joins(:managers).select("managers.last_name").where('managers.user_id = ?', object.id).present?
      User.joins(:managers).select("managers.last_name").where('managers.user_id = ?', object.id).first.last_name
    else
      -1
    end
  end
  # def last_name
  #   if User.joins(:students).select("students.first_name").where('students.user_id = ?', object.id).present?
  #     User.joins(:students).select("students.first_name").where('students.user_id = ?', object.id).first.first_name
  #   else
  #     -1
  #   end
  # end
  # has_many :managers
  # has_many :teachers
end
