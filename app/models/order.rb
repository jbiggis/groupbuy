# == Schema Information
# Schema version: 20101201185709
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  deal_id    :integer
#  coupon_id  :integer
#  status     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base

belongs_to :user
belongs_to :deal
belongs_to :coupon

attr_accessor :cardholder_name, :card_number, :security_code, :expiry_date, :billing_address, :city, :province, :postal_code, :quantity

attr_accessible  :cardholder_name, :card_number, :security_code, :expiry_date, :billing_address, :city, :province, :postal_code, :quantity




end
