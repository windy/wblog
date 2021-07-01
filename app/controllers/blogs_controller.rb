class BlogsController < ApplicationController
  def show
    cookies[:cable_id] = SecureRandom.uuid
    @post = Post.find(params[:id])
    @post.visited
    @prev = Post.where('created_at < ?', @post.created_at).order(created_at: :desc).first
    @next = Post.where('created_at > ?', @post.created_at).order(created_at: :asc).first
    @comments = @post.comments.order(created_at: :desc)
    @likes_count = @post.likes.count
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to edit_admin_post_path(@post)
  end
end
