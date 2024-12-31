require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

class AdminConstraint
  def matches?(request)
    return false unless request.session[:current_admin_id].present?
    admin = Administrator.find_by(id: request.session[:current_admin_id])
    admin.present?
  end
end

Rails.application.routes.draw do

  resources :blogs, only: [:show, :edit] do
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :create, :show, :update, :destroy] do
      collection do
        get :refresh
      end
    end
  end

  resources :archives, only: [:index]
  resources :photos, only: [:create]

  get '/about', to: 'home#about'

  namespace :admin do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
    resource :account, only: [:edit, :update]

    resources :posts, only: [:index, :new, :edit, :create, :update, :destroy] do
      collection do
        post :preview
      end
      resources :comments, only: [:index, :destroy]
    end

    resources :all_comments, only: [:index, :destroy]
    resources :labels


    root to: 'dashboard#index'
  end

  mount Sidekiq::Web => '/sidekiq', constraints: AdminConstraint.new
  #mount ActionCable.server => '/cable'
  root to: 'home#index'
end