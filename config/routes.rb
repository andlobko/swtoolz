Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: 'static#home', as: :authenticated_root
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  scope "/admin" do
    resources :users
  end

  #resources :users

  resources :roles, except: [:destroy]

  controller :static do
    get :home
  end

  resources :subnets
  resources :ip_addrs, only: [:show, :edit, :update, :destroy]

end
