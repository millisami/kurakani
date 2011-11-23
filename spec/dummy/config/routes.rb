Rails.application.routes.draw do

  resources :posts
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  # get "signup" => "users#new", :as => "signup"
  # resources :users
  resources :sessions
  
  mount Kurakani::Engine => "/kurakani"
end
