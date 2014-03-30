class LikesController < ApplicationController
  layout false

  def index
    post = Post.find( params[:blog_id] )
    render :json=> { success: true, count: post.likes.size }
  end

  def create
    post = Post.find( params[:blog_id] )
    like = Like.new
    like.post = post
    if like.save
      render :json=> { success: true }
    else
      render :json=> { success: false }
    end
  end

  def destroy
    post = Post.find( params[:blog_id] )
    like = post.likes.find(params[:id])
    if like.destroy
      render :json=> { success: true }
    else
      render :json=> { success: false }
    end
  end
end
