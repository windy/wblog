class LikesController < ApplicationController
  layout false

  def index
    post = Post.find( params[:blog_id] )
    render :json=> { success: true, count: post.liked_count }
  end

  def is_liked
    post = Post.find( params[:blog_id] )
    if post.likes.where(id: params[:id]).first
      render text: true
    else
      render text: false
    end
  end

  def create
    post = Post.find( params[:blog_id] )
    like = post.likes.build

    if like.save
      render :json=> { success: true, id: like.id.to_s, count: post.liked_count }
    else
      render :json=> { success: false, count: post.liked_count }
    end
  end

  def destroy
    post = Post.find( params[:blog_id] )
    like = post.likes.find(params[:id])
    if like.destroy
      render :json=> { success: true, count: post.reload.liked_count }
    else
      render :json=> { success: false, count: post.reload.liked_count }
    end
  end
end
