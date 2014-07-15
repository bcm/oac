Rails.application.routes.draw do
  root 'home#index'

  get ':year/:mon', to: 'home#index', as: :home_dated, format: false, constraints: {year: /\d{4}/, mon: /\d{1,2}/}

  get 'feed', to: 'feed#show', as: :feed
  get 'calendar', to: 'calendar#show', as: :calendar

  post '/auth/:provider/callback', to: 'sessions#create' # no name cos it should never be referenced from app code
  get '/auth/signout', to: 'sessions#destroy', as: :sign_out
end
