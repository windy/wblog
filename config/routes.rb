WBlog::Application.routes.draw do
  root :to => 'blogs#index'
  resources :blogs, :only=>[:index, :show] do
    collection do
      get :rss
    end
  end

  # photos
  resources :photos, :only=>[:create]
  
  namespace :admin do
    resources :posts do
      collection do
        post :preview
      end
    end
  end
  match '/about' => 'home#index'
  match '/admin' => 'admin/posts#new'
  match '/:type' => 'blogs#index'
end
