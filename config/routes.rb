Rails.application.routes.draw do

  namespace :admin do
    resources :teachers
    resources :parents
    resources :home
    resources :communiques
  end 
  
  resources :eleves, only: [:index, :show]
  resources :teachers, only: [:index, :show]
  resources :communiques, only: [:index, :show]
  resources :parents, only: [:index, :show]
  resources :home, only: [:index]
 
  devise_for :users

  root to: "home#index"

end
