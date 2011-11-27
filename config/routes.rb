Kurakani::Engine.routes.draw do
  resources :comments
  namespace :admin do
    resources :comments
  end
end
