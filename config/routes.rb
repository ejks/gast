Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :promotions
      resources :vendors do
        member do
          get :saved_promotions
          post :create_promotion
        end
      end

      resources :customers do
        member do
          get :owned_deals
          post :get_coupon
          get :show_coupons
          put :cancel_coupon
        end
      end
    end
  end
end
