
class EmailMailer < ActionMailer::Base
	    default :from =>"ryan@railscast.com"
def daily_email(email)

@deal = Deal.find_active



	mail(:to=> email, :subject => "Registered")
end


end
