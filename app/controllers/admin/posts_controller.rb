class Admin::PostsController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def new
    @post = Post.new
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def create
    @post = Post.new( post_params )
    if @post.save
      flash[:notice] = "success!"
      redirect_to root_path
    else
      flash[:alert] = "fail!"
      render :action=>:new
    end
  end

  def update
  end

  def preview
    render :text => Post.render_html(params[:content] || "")
  end
  
  def post_params
    params.require(:post).permit(:title, :content, :type)
  end
end
