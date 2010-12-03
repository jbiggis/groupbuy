class DealsController < ApplicationController

 before_filter :authenticate_admin!	
	
  def index
   	
	 @title = "All Deals"

	 @deals = Deal.all

  end

  def show
    

	  @deal = Deal.find(params[:id])
	  @title = @deal.title

  end

  def new
   
	  @deal = Deal.new
	@title = "Create a new deal"

  end


  def edit
  
	  @deal = Deal.find(params[:id])
  	@title = "Edit " + @deal.title

  end


  def create
  
	 @deal = Deal.new(params[:deal])

       if @deal.save
       redirect_to(@deal, :notice => 'Deal was successfully created.') 
      else

             render "new"
   
      end
    
  end


  def update
   
	  @deal = Deal.find(params[:id])

      if @deal.update_attributes(params[:deal])
        redirect_to(@deal, :notice => 'Deal was successfully updated.') 
      
      else
         render 'edit'
      end
    
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

      redirect_to(deals_url)

  end


end
