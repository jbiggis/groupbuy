# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.define :user do |user|

	user.name			"Coupon Guy"
	user.email 			"couponguy@hotmail.com"
	user.password 			"1234"
	user.password_confirmation	"1234"

end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :micropost do |micropost|

	micropost.content 	"Foo bar"
	micropost.association 	:user
end



