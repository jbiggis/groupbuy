class PagesController < ApplicationController

  def about
  	@title = 'About'
  end

  def contact
	
	 @title = 'Contact'

  end

  def how_it_works

	@title = 'How It Works'

  end

end
