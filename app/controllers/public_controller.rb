class PublicController < ApplicationController
	
       before_filter :deny_admin, :only =>[:create]


	def home

	#@deal = Deal.where("start_time < ? AND end_time > ?", Time.now, Time.now).first
	@deal = Deal.find_active

	@end_year =  @deal.end_time.utc.strftime("%Y").to_i
	@end_month =  @deal.end_time.utc.strftime("%m").to_i
	@end_day =  @deal.end_time.utc.strftime("%e").to_i
	@end_hour =  @deal.end_time.utc.strftime("%H").to_i

	
	end


	def deal

		@deal = Deal.find(params[:id])

	end

	def past_deals

		@deals = Deal.where("showoff = ?", true).all

	end


	def checkout

		@title = "Checkout"
	
		@deal = Deal.find(params[:id])


		
		if user_signed_in? 

			@user = current_user
			
		elsif !anybody_signed_in?		
		
			@user = User.new

		end

		@order = Order.new


	end

	def create
		
		#to do: check validity of everything before saving anything, otherwise, will end 
		#up saving one thing and not another, e.g. created user, and coupon, but not order.
		#change 'status' to string
		#validate user email before submitting.

	if user_signed_in?  

		@user = current_user
	
	else
	
		@user = User.create!(params[:user])

	end 


	quantity = params[:order][:quantity].to_i

	
	until quantity == 0

		@coupon = @user.coupons.build

		@coupon.deal_id = params[:order][:deal_id]

		@coupon.purchased_date = Time.now

		@coupon.expiration_date = @coupon.deal.expiration_date

		@coupon.status = "pending"
		
		# Set @coupon.coupon_code

		if @coupon.save

			@order = @user.orders.build(params[:order])
			
			#@order.deal_id doesn't save! Why? 
			#Have to add in this line below temporarily until I figure it out
			
			@order.deal_id = params[:order][:deal_id]

			
			# if deal has not tipped yet

			@order.status = "authorized"

			# elsif deal has tipped
			
			# @order.status = "captured"
			
			@order.coupon_id = @coupon.id
		
			
			if @order.save
				
				quantity -= 1
			
			else

				flash.now[:error] = "There is an error purchasing this deal."
				render :action => "checkout"
				
				#stop action

			end
		else
			
			flash.now[:error] = "There is an error purchasing this deal."
			render :action => "checkout"

			#stop action

		end


	end
	
		redirect_to(root_path, :notice => "Deal purchased.")
	
	end


	
	private

	def deny_admin

			flash[:error] = "Admins cannot make purchases"
	       		redirect_to(root_path) unless !admin_signed_in?
		
	end



end
