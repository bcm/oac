Rails.application.routes.draw do
  root 'home#index'

  get 'calendar' => 'calendar#show', as: :calendar
end
