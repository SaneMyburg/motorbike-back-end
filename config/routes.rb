Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy] do
        resources :motorbikes, only: [:index, :create, :destroy] do
          resources :reservations, only: [:index, :create, :destroy]
        end
        resources :reservations, only: [:index, :create, :destroy]
      end
      resources :motorbikes, only: [:index, :create, :destroy]
      resources :reservations, only: [:index, :create, :destroy]
      post 'users/login', to: 'users#login'
    end
  end  
end
