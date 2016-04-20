WBlog::Application.routes.draw do

  resources :blogs, :only=>[:index, :show, :edit] do
    collection do
      get :rss
    end
    resources :comments, only: [:index, :create]
    resources :likes, only: [:index, :create, :destroy] do
      member do
        get :is_liked
      end
    end
  end


  resources :archives
  resources :subscribes do
    collection do
      post :cancel
    end
  end
  get '/unsubscribe' => 'subscribes#index'
  # photos
  resources :photos, only: [:create]
  get '/qrcodes' => 'qrcodes#show'

  namespace :admin do
    resources :posts do
      collection do
        post :preview
      end
      resources :comments
    end
    resources :sessions, :only=>[:new, :create, :destroy]
    root 'dashboard#index'
  end

  get '/about' => 'home#index'
  get '/mobile' => 'home#mobile'

  root 'blogs#index'
end
