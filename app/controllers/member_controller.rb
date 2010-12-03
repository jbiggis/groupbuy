class MemberController < ApplicationController

before_filter :authenticate_user!

def my_coupons

	@coupons = Coupon.find_all_by_user_id(current_user.id)

end

def my_account

end

def my_profile

	@profile = Profile.find_by_user_id(current_user.id)
	
end


end
