Rails.application.routes.draw do
  root 'home#index'
  get 'sign_up', to: "registrations#new"
  post "sign_up" => "registrations#create"

  get 'login', to: "sessions#login"
  post "login" => "sessions#create"
  delete 'logout' => "sessions#delete"

  post "org" => "organisations#create"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
