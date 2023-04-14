Rails.application.routes.draw do
  
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
    resources :home
    resources :communiques, only: [:index, :show, :destroy, :new, :create, :edit, :update]
    resources :eleves, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    get '/search', to: 'eleves#search'
    # get '/search', to: 'parents#search'

  end 
  
  resources :eleves, only: [:index, :show]
  resources :teachers, only: [:index, :show]
  resources :communiques, only: [:index, :show]
  resources :home, only: [:index]
  resources :messages, only: [:show, :update, :destroy, :new, :create, :edit]

 
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "home#index"

end
