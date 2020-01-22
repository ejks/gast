Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :promotions
      resources :customers
      get '/customers/:id/owned_deals', to: "customers#owned_deals"
    end
  end
end
