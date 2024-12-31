# app/controllers/blog_controller.rb

class BlogController < ApplicationController
  before_action :set_post, only: [:show, :create_comment, :update_comment, :destroy_comment]
  before_action :set_comment, only: [:update_comment, :destroy_comment]

  def show
    if comments_enabled?
      @comments = @post.comments
    else
      @comments = []
    end
  end

  def create_comment
    if comments_enabled?
      @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        render :show
      end
    else
      redirect_to @post, alert: 'Comments are disabled.'
    end
  end

  def update_comment
    if comments_enabled?
      if @comment.update(comment_params)
        redirect_to @post, notice: 'Comment was successfully updated.'
      else
        render :show
      end
    else
      redirect_to @post, alert: 'Comments are disabled.'
    end
  end

  def destroy_comment
    if comments_enabled?
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    else
      redirect_to @post, alert: 'Comments are disabled.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def comments_enabled?
    Rails.application.config_for(:features)['comments_enabled']
  end
end
