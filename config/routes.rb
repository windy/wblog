WBlog::Application.routes.draw do

  get 'hello/test'

  resources :blogs, :only=>[:index, :show, :edit] do
    collection do
      get :rss
    end
    resources :comments, only: [:index, :create] do
      collection do
        get :refresh
      end
    end
    resources :likes, only: [:index, :create, :destroy] do
      member do
        get :is_liked
      end
    end
  end


  resources :archives
  resources :subscribes, only: [:index, :new, :create]

  resources :unsubscribes, only: [:index, :new, :create]
  # photos
  resources :photos, only: [:create]
  get '/qrcodes' => 'qrcodes#show'

  namespace :admin do
    resources :posts, except: [:show] do
      collection do
        post :preview
      end
      resources :comments
    end
    resources :sessions, :only=>[:new, :create, :destroy]
    resources :subscribes, only: [:index] do
      member do
        post :enable
        post :disable
      end
    end
    root 'dashboard#index'
  end

  get '/about' => 'home#index'
  get '/mobile' => 'home#mobile'

  root 'blogs#index'

  mount ActionCable.server => '/cable'
end
