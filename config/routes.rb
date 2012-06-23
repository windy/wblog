WBlog::Application.routes.draw do
  root :to => 'blogs#index'
  resources :blogs, :only=>[:index, :show]
end
