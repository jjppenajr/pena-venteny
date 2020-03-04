Rails.application.routes.draw do
  # devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "address", to: "user#address", format: :json
  post "loan", to: "user#loan", format: :json
  post "login", to: "user#authenticate", format: :json
end