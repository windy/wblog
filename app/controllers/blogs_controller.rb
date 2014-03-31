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
    created_at = Time.at(@post.created_at.to_f)
    @prev = Post.where(:created_at.lt => created_at).desc(:created_at).first
    @next = Post.where(:created_at.gt => created_at).asc(:created_at).first
    @comments = @post.comments
  end
end
