# encoding : utf-8
class BlogsController < ApplicationController
  def index
    type = params[:type]
    page = params[:page].to_i
    page = 1 if params[:page].nil?
    max = 3
    if type or type == ""
      @posts = Post.paginate( :page=>page, :limit=> max ).where(type: map[type]).order(:created_at => :desc )
    else
      @posts = Post.paginate( :page=>page, :limit=> max ).all.order(:created_at => :desc )
    end
    @page = page
    @has_old = @posts.to_a.size == max
    @has_new = ! ( page == 1 )
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
