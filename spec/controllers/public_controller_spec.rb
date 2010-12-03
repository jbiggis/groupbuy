require 'spec_helper'

describe PublicController do


 describe "GET 'home'" do
    

  describe "when not signed in" do

	  before(:each) do
		  get :home
	  end

	  
    it "should be successful" do
       response.should be_success
    end

    it "should have a title" do
        response.should have_selector("title", :content => "Home")
    
    end
  end
  
  describe "when signed in" do

 before(:each) do
        @user = test_sign_in(Factory(:user))
      end

      it "should have the right follower/following counts" do
        get :home
        response.should have_selector("a", :href => following_user_path(@user),
                                           :content => "0 following")
        response.should have_selector("a", :href => followers_user_path(@user),
                                           :content => "1 follower")
      end



  end




  
  end

  

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have a title" do
get 'contact'
response.should have_selector("title", :content => @base_title + "Contact")
    
    end
  end

describe "GET 'about'" do
	it "should be successful" do
	get 'about'
	response.should be_success
	end

	it "should have a title" do
	get 'about'
	response.should have_selector("title", :content => @base_title + "About")
    
	end
end

describe "Get 'Help'" do

	it "should be successful" do
	
		get 'help'
		response.should be_success
	
	end
	it "should have a title" do
		get 'help'
		response.should have_selector("title", :content => @base_title + "Help")
    
	
	end

end


end
