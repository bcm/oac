Rails.application.routes.draw do
  root 'home#index'

  get ':year/:mon' => 'home#index', as: :home_dated, format: false, constraints: {year: /\d{4}/, mon: /\d{1,2}/}

  get 'feed' => 'feed#show', as: :feed
  get 'calendar' => 'calendar#show', as: :calendar
end
