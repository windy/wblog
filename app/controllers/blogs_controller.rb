# encoding : utf-8
class BlogsController < ApplicationController
  def index
    type = params[:type]
    if type or type == ""
      @posts = Post.where(type: map[type]).order(:created_at => :desc )
    else
      @posts = Post.all.order(:created_at => :desc )
    end
  end

  def rss
    @posts = Post.all.order(:created_at => :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
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
