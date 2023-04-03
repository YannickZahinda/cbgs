Rails.application.routes.draw do

  namespace :admin do
    resources :teachers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :parents, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end 

  devise_for :users

  root to: "home#index"

  resources :eleves
  resources :teachers
  resources :communiques
  resources :parents
  resources :home, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
