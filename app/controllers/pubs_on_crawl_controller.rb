class PubsOnCrawlController < ApplicationController

	def update
		PubsOnCrawl.find_and_update_status params[:id]
		pub = PubsOnCrawl.find(params[:id])
		redirect_to crawl_path(pub.crawl)
  end

end
