class Admins::AdminsController < Devise::RegistrationsController

def index

	@admins = Admins.all

end

end
