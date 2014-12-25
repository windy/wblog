# encoding : utf-8
class BlogsController < ApplicationController

  def index
    @newest = Post.desc(:created_at).first
    @recent = Post.desc(:created_at).to_a[1..3]
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
    @post = Post.find(params[:id])
    @post.visited
    @prev = Post.where(:created_at.lt => @post.created_at).desc(:created_at).where(:id.ne => @post.id).first
    @next = Post.where(:created_at.gt => @post.created_at).asc(:created_at).where(:id.ne => @post.id).first
    @comments = @post.comments
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
