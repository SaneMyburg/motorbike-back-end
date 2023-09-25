Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy] do
        resources :motorbikes, only: [:index, :create, :destroy]
        resources :reservations, only: [:index, :create, :destroy]
      end
      resources :motorbikes, only: [:index, :create, :destroy]
      resources :reservations, only: [:index, :create, :destroy]
    end
  end
end
