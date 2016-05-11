class RoundsController < ApplicationController
skip_before_action :verify_authenticity_token

	def update
		round = Round.find params[:id]
		if !round.visible
			Round.reveal params[:id]
		else
			Round.log_time params[:id]
		end
		render :json => { :status => "success", :message => round.crawl}, :status => 200
  end
end
