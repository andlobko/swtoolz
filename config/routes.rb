Rails.application.routes.draw do

  root to: 'static#home'

  devise_for :users
  scope "/admin" do
    resources :users
  end

  #resources :users

  resources :roles

  controller :static do
    get :home
  end

  resources :subnets
  resources :ip_addrs, only: [:show, :edit, :update, :destroy]

end
