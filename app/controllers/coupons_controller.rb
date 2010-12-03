class CouponsController < ApplicationController

 before_filter :authenticate_admin!
	
  def index
    @coupons = Coupon.all

  end


  def show
    @coupon = Coupon.find(params[:id])


    end
  end

  def new
    @coupon = Coupon.new


  end


  def edit
    @coupon = Coupon.find(params[:id])
  end


  def create
    @coupon = Coupon.new(params[:coupon])

      if @coupon.save
       
	      redirect_to(@coupon, :notice => 'Coupon was successfully created.')     
      else
         
	      render :action => "new" 

      end
  end

  def update
   
       @coupon = Coupon.find(params[:id])

        if @coupon.update_attributes(params[:coupon])
       
	 redirect_to(@coupon, :notice => 'Coupon was successfully updated.') 

      else
        render :action => "edit" 

      end
    
  end

  def destroy
      
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

     redirect_to(coupons_url) 

end
