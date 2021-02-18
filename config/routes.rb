Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "pages#index"
    get "store" => "pages#store"
    get "blog" => "pages#blog"
    get "suggest" => "pages#suggest"
    get "favorites" => "pages#favorites"
    resources :cart, only: %i(index create update)
    resources :order, only: %i(index create)
    resources :products, only: :show
    resources :users
    post "remove-cart-item/:id" => "cart#remove_cart_item", as: "remove_cart_item"
    get "remove-cart-all-item" => "cart#remove_all_item"
    resources :password_resets, except: %i(index show destroy)
    namespace :admin do
      get "/" => "admins#dashboard"
      resources :orders
    end
  end
end
