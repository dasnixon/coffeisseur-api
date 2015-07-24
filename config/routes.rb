Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    post '/users/sign_in', to: 'sessions#create'
  end
  namespace :api do
    namespace :v1 do
      get '/users/me', to: 'users#me'
      resources :roasts, only: [:index, :show, :create, :update, :destroy]
      resources :roasters, only: [:index, :show, :create, :update, :destroy]
      resources :users, except: [:new, :edit]
      resources :cups, only: [:index, :show, :create, :update, :destroy]
      resources :coffee_shops, only: [:index, :show, :create, :update, :destroy]
      resources :coffee_shop_locations, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
