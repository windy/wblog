WBlog::Application.routes.draw do
  root :to => 'blogs#index'
  resources :blogs, :only=>[:index, :show]
  namespace :admin do
    resources :posts
  end
end
