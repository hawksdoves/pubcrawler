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
      pubs = Crawl.get_pubs(crawl.start_postcode)
      challenges = Crawl.get_challenges

      rounds = pubs.map.with_index do |pub, index|
        Round.create(
                      pub_id: pub.id,
                      challenge_id: challenges[index].id,
                      visible: (index == 0)
                    )
      end

      crawl.rounds << rounds

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
