class CrawlsController < ApplicationController
  def index
    @crawls = Crawl.all
  end

  def show
    @crawl = Crawl.find params[:id]
    # render json: Crawl.find(params[:id]), include: [:pubs, :rounds, :challenges]
  end

  def new
    @crawl = Crawl.new
  end

  def create
    crawl = Crawl.new crawl_params
    if crawl.save
      crawl.rounds << Crawl.new_pubs(crawl.start_postcode)
      byebug
      
      crawl.challenges << Round.get_challenges

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
