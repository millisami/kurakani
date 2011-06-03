Rails.application.routes.draw do

  resources :posts

  mount Kurakani::Engine => "/kurakani"
end
