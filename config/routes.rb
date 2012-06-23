WBlog::Application.routes.draw do
  root :to => 'blogs#index'
  resources :blogs, :only=>[:index, :show]
  namespace :admin do
    resources :posts do
      collection do
        post :preview
      end
    end
  end
  match '/admin' => 'admin/posts#new'
end
