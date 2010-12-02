# == Schema Information
# Schema version: 20101201185709
#
# Table name: coupons
#
#  id              :integer         not null, primary key
#  coupon_code     :string(255)
#  user_id         :integer
#  deal_id         :integer
#  status          :integer
#  purchased_date  :datetime
#  expiration_date :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

class Coupon < ActiveRecord::Base

	belongs_to :users
	belongs_to :deals
	has_one :order

end
