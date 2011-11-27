Rails.application.routes.draw do

  resources :posts
  root :to => "posts#index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "unauthorized" => "sessions#new", :as => "unauthorized"
  # get "signup" => "users#new", :as => "signup"
  # resources :users
  resources :sessions
  
  mount Kurakani::Engine => "/kurakani"
end
