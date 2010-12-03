require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
	
    	make_admin
	make_users
	make_deals
	make_orders


 end
end

def make_admin

    Admin.create!(:name => "Jonathan Chiu",
            	    	 :email => "jonny@grabbit.ca",
                	 :password => "qweasd",
                 	:password_confirmation => "qweasd", 
			 :super => true)
        Admin.create!(:name => "Admin Dude",
            	    	 :email => "admin@grabbit.ca",
                	 :password => "qweasd",
                 	:password_confirmation => "qweasd")
end

def make_users

    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@grabbit.ca"
      password  = "qweasd"
      user = User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    
    	user.profiles.create!(:gender => "male",
			:DOB => "11/11/1986")
    
    end
 end

def make_deals

20.times do |n|
Deal.create!(:title => "The Juicy Burger Deal",
	     :description => "$20 for $40 worth of burgers",
	     :price => 20,
	     :value => 40,
	     :summary => "Though barbeque sauce can be used to power tractors or grease slip ‘n' slides, it’s best for making beans sing and chickens dance. Start a party on the tongue's floor with today’s Groupon. For $15, you get $30 worth of barbeque at Highway 61 Southern Barbeque, located on Bayview Avenue. Voted best ribs in Toronto by postcity.com in September 2009, Highway 61's expansive menu bonds a carefully crafted sauce, classic dishes of the American South, and a light-hearted attitude to create a convivial compound that pays tribute to all things barbeque. A calendar stacked with local music acts further fuels feelings of fun, like a jester doused in lighter fluid. ",
	     :fine_print => "1 coupon per table",
	     :expiration_date => "01/01/2011",
	     :start_time => "12/#{n+1}/2010",
	     :end_time => "12/#{n+2}/2010",
	     :company_name => "company-#{n+1}",
		:company_address => "#{n+1} st.",
		:company_website => "www.awesome.com",
		:company_phone => "60320328",
	       :image_file_name => "#{n+1}.jpg",
       		:image_content_type => "image/jpeg",
 		:image_file_size => 52198,
		:image_updated_at => 12/12/2010)		
end

		


end

def make_orders

	User.all(:limit => 10).each do |user|

		Deal.all(:limit =>4).each do |deal|
			
		coupon = user.coupons.create!(:deal_id => deal.id,
					    :status => 'pending',
					   :purchased_date => DateTime.now,
					   :expiration_date => deal.expiration_date
					   )
			user.orders.create!(:deal_id => deal.id,
					   :coupon_id => coupon.id,
					   :status => 'authorized')

		end
	end

end


