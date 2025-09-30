Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "api/get_price", to: "api#get_price"     # JSON API
  get "api/get_price_db", to: "api#get_price_db"     # JSON API
    get "api/test1", to: "api#test1"
end
