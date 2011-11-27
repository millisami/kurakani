Kurakani::Engine.routes.draw do
  resources :comments
  namespace :admin do
    resources :comments
    
    root to: "comments#index"
    
  end
end
