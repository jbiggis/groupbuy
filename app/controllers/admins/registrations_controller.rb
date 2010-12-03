
class Admins::RegistrationsController < Devise::RegistrationsController
	
def index

	@admins = Admin.all

end

end
