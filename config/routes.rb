Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#index"
    get "store" => "pages#store"
    get "blog" => "pages#blog"
    get "suggest" => "pages#suggest"
    get "favorites" => "pages#favorites"
  end
end
