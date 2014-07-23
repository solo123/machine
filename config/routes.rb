Rails.application.routes.draw do
  resources :account_balances

  resources :accounts

  resources :order_payments

  resources :warehouses

  resources :product_histories

  devise_for :employees
  resources :godown_items

  resources :godown_entries do
    collection do
      post :import
    end
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
      get :autocomplete_godown_item_terminal_code
    end
    member do
      get :delivery
      post :add_item
      get :recaculate
    end
  end


end
