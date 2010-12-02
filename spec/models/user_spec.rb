require 'spec_helper'

describe User do

	
	before (:each) do
	
		@attr = {:name =>"Jonathan Chiu", :email => "jonny@grabbit.ca", 
			:password => "password", :password_confirmation => "password"}
	
	end


	it "should create a new instance given valid attributes" do

		User.create!(@attr)

	end


	describe "name validations" do

		it "should require a name" do

			no_name_user = User.new(@attr.merge(:name => ""))
			no_name_user.should_not be_valid

		end
		
		
	end


	describe "email validations" do



		it "should require an email" 	do	
	
			no_email_user = User.new(@attr.merge(:email=>""))
			no_email_user.should_not be_valid
	
		end
  

		it "should accept valid email addresses" do
	
			addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
			addresses.each do |email|
	
				valid_email_user = User.new(@attr.merge(:email => email))
				valid_email_user.should be_valid
			end
	
		end


		it "should not accept invalid email address" do
			addresses = %w[asdfs@asdf.da,sf.com user@foo,com user_at_food.org 
				example.user@foo.]
			addresses.each do |email|
				invalid_email_user = User.new(@attr.merge(:email => email))
				invalid_email_user.should_not be_valid

			end
		end


		it "should reject duplicate email addresses" do

			User.create!(@attr)
			duplicate_email_user = User.new(@attr)
			duplicate_email_user.should_not be_valid

		end
		
		
		it "should reject email addresses identical up to case" do
			upcased_email = @attr[:email].upcase
			User.create!(@attr.merge(:email => upcased_email))
			user_with_duplicate_email = User.new(@attr)
			user_with_duplicate_email.should_not be_valid
		end

	end

	describe "password validations" do



		it "should have a password" do

		no_password_user = User.new(@attr.merge(:password=>"", :password_confirmation=>""))
		no_password_user.should_not be_valid


		end


		it "should reject short passwords" do

		short_password = "a" * 3
		short_password_user = User.new(@attr.merge(:password => short_password, 
							  :password_confirmation => short_password))
		short_password_user.should_not be_valid

		end


		it "should reject long passwords" do

		long_password = "a" * 41
		long_password_user = User.new(@attr.merge(:password => long_password, 
							  :password_confirmation => long_password))
		long_password_user.should_not be_valid

		end


		it "should require a matching password confirmation" do

		non_matching_pass_user = User.new(@attr.merge(:password_confirmation => "invalid"))
		non_matching_pass_user.should_not be_valid

		end

	end


end
