# == Schema Information
# Schema version: 20101201185709
#
# Table name: deals
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  price              :decimal(, )
#  value              :decimal(, )
#  description        :string(255)
#  fine_print         :string(255)
#  expiration_date    :datetime
#  start_time         :datetime
#  end_time           :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  company_name       :string(255)
#  company_address    :string(255)
#  company_website    :string(255)
#  company_phone      :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Deal < ActiveRecord::Base

	 translatable_columns :title, :description, :fine_print, :summary 

has_many :orders
has_many :coupons
has_many :companies, :dependent => :destroy

accepts_nested_attributes_for :companies, :allow_destroy => true, :reject_if => lambda { |a| a[:name].blank? }


has_attached_file :image, :url => "/assets/deals/:id/:style/:basename.:extension",
	:path => ":rails_root/public/assets/deals/:id/:style/:basename.:extension"

def self.find_active
	find(:first, :conditions => ["start_time < ? AND end_time > ?", Time.now.in_time_zone, Time.now.in_time_zone])
end

end
