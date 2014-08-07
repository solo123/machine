Rails.application.routes.draw do
  resources :payments

  root 'home#index'
  resources :home
  resources :account_balances

  resources :accounts

  resources :order_payments

  resources :warehouses

  resources :product_histories

  devise_for :employees
  resources :godown_items

  resources :godown_entries do
    member do
      get :do_import
      get :import
      get :check
      get :clear_items
    end
  end

  resources :products

  resources :delivery_items

  resources :deliveries

  resources :partners

  resources :staffs

  resources :companies

  resources :order_items
  resources :product_warehouses

  resources :providers
  resources :employees do
    collection do
      post :add
    end
  end

  resources :orders do
    collection do
      get :prepare_import
      post :import
      get :autocomplete_godown_item_terminal_code
    end
    member do
      get :delivery
      post :add_item
      get :recaculate
      post :pay
    end
  end


end
