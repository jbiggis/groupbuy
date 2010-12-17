class EmailMailer < ActionMailer::Base
  default :from => "admin@dealamama.com"
  def daily_email

	  emails = Email.all
	emails.each do |email2|

	  mail(:to => email2.email., :subject => "Dealamama Daily Deal")
  end
end
