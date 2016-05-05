Rails.application.routes.draw do
  resources :crawls
  resources :pubs_on_crawl, only: :update
end
