class CrawlsController < ApplicationController

  def index
    @crawls = Crawl.all
  end

  def show
    @crawl = Crawl.find params[:id]
  end

  def new
    @crawl = Crawl.new
  end

  def create
    crawl = Crawl.new crawl_params
    if crawl.save
      crawl.pubs_on_crawls << Crawl.new_pubs(crawl.start_postcode)

      CrawlChallenge.get_challenges.each_with_index do | challenge, index |
        crawl.crawl_challenges << CrawlChallenge.create( challenge_id: challenge.id)
      end

      redirect_to crawl_path(crawl)
    else
      render 'new'
    end
  end

  private

  def crawl_params
    params.require(:crawl).permit :name, :start_postcode
  end
end
