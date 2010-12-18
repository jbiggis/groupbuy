namespace :cron do

	desc "Send daily subscription Email"
	task(:email => :environment) {p Email.deliver }

end
