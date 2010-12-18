class Email < ActiveRecord::Base


	attr_accessible :email
def self.deliver

subscribers = Email.all

subscribers.each do |subscriber|

EmailMailer.daily_email(subscriber.email).deliver

end

end
end
