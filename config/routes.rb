Rails.application.routes.draw do
  resources :crawls
  resources :challenges
  resources :rounds, only: :update
  resources :notification
end
