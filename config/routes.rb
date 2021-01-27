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
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index show destroy)
  end
end
