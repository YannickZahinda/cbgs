Rails.application.routes.draw do
  get 'dashboard/index', to: 'dashboard#index'
  get 'dashboard/new', to: 'dashboard#new'
  get 'dashboard/create', to: 'dashboard#create'
  get 'dashboard/edit', to: 'dashboard#edit'
  get 'dashboard/update', to: 'dashboard#index'
  get 'dashboard/destroy', to: 'dashboard#destroy'
  
  namespace :admin do
    resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :messages, only: [:index, :show, :destroy]
    resources :teachers do
      collection do
        get '/search', to: 'teachers#search'
      end
    end
    resources :parents, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      collection do
        get '/search', to: 'parents#search'
      end
    end
    resources :home do
      collection do
        get '/logged_in_users', to: 'home#logged_in_users', as: 'logged_in_users'
      end
    end
    resources :communiques, only: [:index, :show, :destroy, :new, :create, :edit, :update]
    resources :eleves, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :letters, only: [:index]
    get '/search', to: 'eleves#search'
    # get '/search', to: 'parents#search'
    # resources :logged_in_users, only: [:logged_in_users]

  end 
  
  resources :eleves, only: [:index, :show]
  resources :teachers, only: [:index, :show]
  resources :communiques, only: [:index, :show]
  resources :home, only: [:index]
  resources :messages, only: [:show, :update, :destroy, :new, :create, :edit]
  # resources :dashboard, only: [:index, :update, :create, :new, :edit, :destroy]
  
  # get 'home/dashboard', to: 'dashboard#index'

 
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "home#index"

end
