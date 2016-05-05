class PubsOnCrawlController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => :create

	def update
		PubsOnCrawl.find_and_update_status params[:id]
		pub = PubsOnCrawl.find(params[:id])
		redirect_to crawl_path(pub.crawl)
  end

end
