# encoding : utf-8
class BlogsController < ApplicationController
  def index
    @newest = Post.desc(:created_at).to_a.first
    @recent = Post.desc(:created_at).to_a[1..2]
  end

  def rss
    @posts = Post.all.order(:created_at => :desc).limit(10)
    render :layout=>false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all.where(post_id: @post.id)
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
