Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :roasts, only: [:index, :show, :create, :update]
      resources :beans, only: [:index, :show, :create, :update]
    end
  end
end
