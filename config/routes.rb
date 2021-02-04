Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#index"
    get "store" => "pages#store"
    get "blog" => "pages#blog"
    get "suggest" => "pages#suggest"
    get "favorites" => "pages#favorites"
    get "/login", to: "session#new"
    post "/login", to: "session#create"
    delete "logout", to: "session#destroy"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resources :users
    resources :cart, only: %i(index create update)
    resources :order, only: %i(index create)
    resources :products, only: :show
    post "remove-cart-item/:id" => "cart#remove_cart_item", as: "remove_cart_item"
    get "remove-cart-all-item" => "cart#remove_all_item"
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index show destroy)
    namespace :admin do
      get "/" => "admins#dashboard"
      resources :orders
    end
  end
end
