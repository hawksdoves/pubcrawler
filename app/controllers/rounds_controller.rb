class RoundsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :create

	def update
		Round.log_time params[:id]
		round = Round.find params[:id]
		redirect_to crawl_path round.crawl
  end
end
