Rails.application.routes.draw do
  
  namespace :admin do
    resources :messages, only: [:index, :show, :destroy]
    resources :teachers
    resources :parents, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :home
    resources :communiques
    resources :eleves, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    get 'eleves/search', to: 'admin/eleves#search'
  end 
  
  resources :eleves, only: [:index, :show]
  resources :teachers, only: [:index, :show]
  resources :communiques, only: [:index, :show]
  resources :home, only: [:index]
  resources :messages, only: [:show, :update, :destroy, :new, :create, :edit]

 
  devise_for :users

  root to: "home#index"

end
