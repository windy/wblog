class Admin::DashboardController < Admin::BaseController
  def index
    @posts_count = Post.all.count
    @comments_count = Comment.all.count
  end
end
