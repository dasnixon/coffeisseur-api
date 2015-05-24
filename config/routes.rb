Rails.application.routes.draw do
  use_doorkeeper
  namespace :api do
    namespace :v1 do
      resources :roasts, only: [:index, :show, :create, :update]
      resources :beans, only: [:index, :show, :create, :update]
      resources :users, except: [:new, :edit, :destroy]
      post 'session', to: 'session#create'
    end
  end
end
