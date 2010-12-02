require 'spec_helper'

describe "LayoutLinks" do
 
	describe "GET /" do

		it "should have a Home page at /" do
   
			get '/'
			response.should have_selector("title", :content => "Home")
    		end
  
   	end


	describe "Get /signup" do

		it "should have a signup page at /signup" do
			get '/signup'
			response.should have_selector("title", :content =>"Sign up")
		end

	end


	describe "Get /signin" do

		it "should have a signin page at /signin" do
			get '/signin'
			response.should have_selector("title", :content =>"Sign in")
		end

	end


	describe "GET /contact" do
		
		it "should have a Contact page at /contact" do
			
			get '/contact'
			response.should have_selector("title", :content =>"Contact")
		end

	end

	describe "GET /about" do
		
		it "should have an About page at /about" do
			get '/about'
			response.should have_selector("title", :content =>"About")
		end

	end


	describe "GET /deals" do

		it "should have a 'Past deals' page" do

			get '/deals'

			response.should have_selector("title", :content => "Past deals")

		end
	end


	describe "GET /how_it_works" do

		it "should have a 'How it works' page" do

			get '/how_it_works'
			response.should have_selector("title", :content => "How it works")

		end

	end



	it "should have the right links on the layout" do

		visit root_path
		
		click_link "About"
		response.should have_selector("title", :content =>"About")

		click_link "Contact"
		response.should have_selector("title", :content =>"Contact")

		click_link "Home"
		response.should have_selector("title", :content =>"Home")

		click_link "Sign up"
		response.should have_selector("title", :content =>"Sign up")

		
		click_link "Sign in"
		response.should have_selector("title", :content =>"Sign up")


	end



	describe "when not signed in" do
		
		it "should have a signin link" do

			visit root_path
			response.should have_selector("a", :href => signin_path,
						      :content => "Sign in")

		end

		it "should have a signup link" do

			visit root_path
			response.should have_selector("a", :href => signup_path,
						      :content => "Sign up")

		end

	end



	describe "when signed in as a member" do


		before(:each) do

		@user = Factory(:user)
		visit signin_path
		fill_in :email,		:with => @user.email
		fill_in :password, 	:with => @user.password
		click_button
		end


		it "should have a signout link" do


			visit root_path
			response.should have_selector("a", :href => signout_path,
						      :content => "Sign out")
		end

		it "should have a 'my stuff' link" do

			visit root_path
			response.should have_selector("a", :href => user_path(@user),
						      :content => "My Stuff")
		
		end

	end

end

