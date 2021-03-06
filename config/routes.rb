# frozen_string_literal: true

# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers do
        resources :customer_products
      end
      resources :ddts do
        resources :ddt_products
      end
      resources :products

      post 'refresh', controller: :refresh, action: :create
      post 'signin', controller: :signin, action: :create
      post 'signup', controller: :signup, action: :create
      delete 'signin', controller: :signin, action: :destroy
    end
  end
end
