Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :crawls
  resources :challenges
  resources :rounds, only: :update
end
