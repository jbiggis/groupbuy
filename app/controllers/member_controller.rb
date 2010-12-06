class MemberController < ApplicationController

before_filter :authenticate_user!

def my_coupons

	@coupons = Coupon.find_all_by_user_id(current_user.id)

end

def show

	@coupon = Coupon.find(params[:id])
respond_to do |format|

format.pdf { render :layout => false}

end

end



def my_account

end

def my_profile

	@profile = Profile.find_by_user_id(current_user.id)
	
end


end
