# == Schema Information
# Schema version: 20101201185709
#
# Table name: profiles
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  gender     :string(255)
#  DOB        :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Profile < ActiveRecord::Base
belongs_to :user

validates :user_id, :presence => true

end
