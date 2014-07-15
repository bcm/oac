Rails.application.routes.draw do
  root 'home#index'

  get 'feed' => 'feed#show', as: :feed
  get 'calendar' => 'calendar#show', as: :calendar
end
