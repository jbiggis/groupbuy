class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end
  
def create
		  
omniauth = request.env["omniauth.auth"]
authentication = Authentication.find_by_provider_and_uid(omniauth['provider'],omniauth['uid'])
	if authentication
		flash[:notice] = "Signed in successfully."
		sign_in_and_redirect(:user, authentication.user)
		elsif current_user
	
current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
flash[:notice] = "Authentication successful"
redirect_to authentications_url

else


email =  omniauth["extra"]["user_hash"]["email"]
name = omniauth["user_info"]["name"]
if user = User.find_by_email(email)

user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])

flash[:notice] = "Signed in successfully."
sign_in_and_redirect(:user, user)

else
user = User.new(:email => email, :name => name)
user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])

user.save!
user.profiles.create!
flash[:notice] = "Signed in successfully."
sign_in_and_redirect(:user, user)
end
end
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end

