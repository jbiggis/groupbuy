require 'spec_helper'

describe Profile do

	before(:each) do

		@user = Factory(:user)

	end


	it "should create a new instance when a user is created" do
	
		

	end


	
	describe "user associations" do

		before(:each) do
			@profile = @user.profile.create!
		end

		it "should have a 'user' attribute" do
			@profile.should respond_to(:user)
		end
		
		it "should have the right associated user" do
			@profile.user_id.should == @user.id
			@profile.user.should == @user
		end


	end

	describe "validations" do


		it "should not be allowed to exist without an associated user" do
		
			Profile.new.should_not be_valid

		end


		it "should require a user id" do
		
			Profile.new.should_not be_valid

		end

		

	end
	
end
