Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :receipts
      resources :appointments
      resources :users
    end
  end
end
