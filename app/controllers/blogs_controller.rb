# encoding : utf-8
class BlogsController < ApplicationController
  def index
    type = params[:type]
    if type or type == ""
      @posts = Post.where(type: map[type])
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def map
  {
    "life"=> "生活",
    "tech"=> "技术",
    "creator"=> "创业"
  }
  end
end
