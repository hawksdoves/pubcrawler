Rails.application.routes.draw do
  resources :crawls
  resources :challenges
  resources :pubs_on_crawl, only: :update
end
