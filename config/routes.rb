Rails.application.routes.draw do
  resources :crawls
  resources :challenges
  resources :crawl_pubs, only: :update
end
