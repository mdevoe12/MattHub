Rails.application.routes.draw do
  root "home#index"

  get '/auth/github', as: :github_login

  get '/auth/:provider/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]
  resources :repo, only: [:index]
  resources :commit, only: [:index]
  resources :following, only: [:index]
  resources :orgs, only: [:index]
end
