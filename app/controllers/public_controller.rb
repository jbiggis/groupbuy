class PublicController < ApplicationController

def home

	@deal = Deal.where("start_time < ? AND end_time > ?", Time.now, Time.now).first

end


def deal

	@deal = Deal.find(params[:id])

end

def past_deals

	@deal = Deal.where("showoff == ?", t)

end


def checkout


end



end
