Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/appts/:id/receipt', to: 'appointments#receipt'
      resources :receipts, only: [:create, :update, :show, :index]
      resources :appointments, only: [:create, :update, :show, :index]
      resources :users, only: [:create, :update, :show, :index]
    end
  end
end
