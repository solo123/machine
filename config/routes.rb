Rails.application.routes.draw do
  resources :godown_items

  resources :godown_entries do
    collection do
      post :import
    end
  end

  resources :products

  resources :delivery_items

  resources :deliveries

  resources :partners

  resources :staffs

  resources :companies

  root 'orders#index'
  resources :order_items

  resources :providers

  resources :orders do
    collection do
      post :import
    end
    member do
      post :stock_in
    end
  end


end
