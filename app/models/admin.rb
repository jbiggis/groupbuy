# == Schema Information
# Schema version: 20101201185709
#
# Table name: admins
#
#  id                 :integer         not null, primary key
#  email              :string(255)     default(""), not null
#  encrypted_password :string(128)     default(""), not null
#  password_salt      :string(255)     default(""), not null
#  sign_in_count      :integer         default(0)
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  failed_attempts    :integer         default(0)
#  unlock_token       :string(255)
#  locked_at          :datetime
#  super              :boolean         default(TRUE)
#  created_at         :datetime
#  updated_at         :datetime
#

class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :trackable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
