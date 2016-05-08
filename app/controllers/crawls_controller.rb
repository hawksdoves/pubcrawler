class CrawlsController < ApplicationController

  # before_action :authenticate_user!, only: [:index, :show]

  def index

    # p "Current signed-in user: " + current_user.inspect
    p
    p request.env
    p "AUTHORIZATION: " + request.env["HTTP_AUTHORIZATION"].inspect
    p ""
    p "Is user signed in?: " + user_signed_in?.inspect
    p ""
    p "TOKEN :" + request.env["HTTP_ACCESS_TOKEN"].inspect
    p "UID " + request.env["HTTP_UID"].inspect
    p "EXPIRY " + request.env["HTTP_EXPIRY"].inspect
    p "CLIENT " + request.env["HTTP_CLIENT"].inspect
    p "TOKEN TYPE " + request.env["HTTP_TOKEN_TYPE"].inspect

    @crawls = Crawl.all
    render json: @crawls
  end

  def show
    @crawl = Crawl.find params[:id]
    render json: @crawl, include: [:pubs, :rounds, :challenges]
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
