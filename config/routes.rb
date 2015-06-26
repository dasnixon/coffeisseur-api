Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, skip: :all
      devise_scope :user do
        post '/users/sign_in', to: 'sessions#create'
      end
      resources :roasts, only: [:index, :show, :create, :update]
      resources :beans, only: [:index, :show, :create, :update]
      resources :users, except: [:new, :edit, :destroy]
    end
  end
end
