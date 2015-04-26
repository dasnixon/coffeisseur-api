Rails.application.routes.draw do
  resources :roasts, only: [:index, :show, :create, :update]
  resources :beans, only: [:index, :show, :create, :update]
end
