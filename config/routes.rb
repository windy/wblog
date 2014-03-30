WBlog::Application.routes.draw do
  root :to => 'blogs#index'

  resources :blogs, :only=>[:index, :show] do
    collection do
      get :rss
    end
    resources :comments, only: [:index, :create]
    resources :likes, only: [:index, :create, :destroy]
  end


  resources :archives
  # photos
  resources :photos, :only=>[:create]
  
  namespace :admin do
    resources :posts do
      collection do
        post :preview
      end
    end
  end
  get '/about' => 'home#index'
  get '/admin' => 'admin/posts#new'
  get '/:type' => 'archives#index'
end
