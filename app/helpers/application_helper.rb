module ApplicationHelper


def title

	base_title = "Groupbuy"

	if @title.nil?

		base_title

	else
		base_title + " | " + @title

	end

end





def email

	@email = Email.new

end


end
