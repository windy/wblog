class Admin::DashboardController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def index
    @posts_count = Post.all.size
    @comments_count = Comment.all.size
    @visited_count = Post.all.inject(0) { |res, p| res + p.visited_count }
    @subscribes_count = Subscribe.all.size
  end
end
