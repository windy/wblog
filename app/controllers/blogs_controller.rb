# encoding : utf-8
class BlogsController < ApplicationController

  def index
    @newest = Post.order(created_at: :desc).first
    @recent = Post.order(created_at: :desc).to_a[1..3]
    respond_to do |format|
      format.html
      format.json
    end
  end

  def rss
    @posts = Post.all.order(:created_at => :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def show
    cookies[:cable_id] = SecureRandom.uuid
    @post = Post.find(params[:id])
    @post.visited
    @prev = Post.where('created_at < ?', @post.created_at).order(created_at: :desc).first
    @next = Post.where('created_at > ?', @post.created_at).order(created_at: :asc).first
    @comments = @post.comments.order(created_at: :desc)
    @likes_count = @post.likes.count
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @post = Post.find( params[:id] )
    redirect_to edit_admin_post_path(@post)
  end
end
