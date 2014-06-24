Rails.application.routes.draw do
  resources :order_items

  resources :providers

  resources :orders do
    collection do
      post :import
    end
  end


end
