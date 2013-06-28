Social::Application.routes.draw do
  get "static_pages/home"
  root :to => 'static_pages#home'
  match '/signup', to: 'users#new'
  resources :users, :except => :show do
    get 'getting_started', :on => :member
    get 'profile', :on => :member   
  end
  resources :microposts do
    get 'like', :on => :member   
  end
  resources :imageposts
  resources :comments do
    get 'like', :on => :member
  end  
  match "getting_started" => "users#getting_started"
  match "profile" => "users#profile"
  resources :sessions, only: [:new, :create, :destroy]
  match '/signout', to: 'sessions#destroy', via: :delete  
end
