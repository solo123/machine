Rails.application.routes.draw do
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
