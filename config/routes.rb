Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy, :show] do
    resources :motorbikes, only: [:index, :create, :destroy] do 
      resources :reservations, only: [:index, :create, :destroy] 
    end
  end
end
