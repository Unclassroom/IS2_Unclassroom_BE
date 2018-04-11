# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  cc         :integer
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StudentSerializer < ActiveModel::Serializer
  attributes :id, :cc, :first_name, :last_name, :email

end
