class EmailsController < ApplicationController




def create

	@email = Email.new(params[:email])

	if @email.save
	
		flash[:success] = "You have successfully subscribed to our email list."

		redirect_to root_path

	else
	
		flash[:error] = "Error in subscibing to our email list."

		redirect_to root_path
	end


end

end
