# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  username        :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
	def to_param
    username
  end
	attr_accessible :name, :email, :password, :password_confirmation, :username
  has_secure_password
end
