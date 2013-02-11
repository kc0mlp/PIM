PIM::Application.routes.draw do
  #Authentication via Sorcery Stuff
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  get "pim_admins/index" 

  resources :posts
  resources :pim_admins
  resources :users do
    collection do
      get :login
    end
    member do
      get :activate
    end
  end
  resources :sessions
  resources :password_reset

  get "blog" => "posts#index", :as => "blog"
  get "register_admin" => "pim_admins#new", :as => "register_admin"

  get "home/index"
  
  root :to => "home#index"


end
