Rails.application.routes.draw do
  devise_for :employees
  resources :godown_items

  resources :godown_entries do
    member do
      get :do_import
      get :check
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
      post :add_item
    end
  end


end
