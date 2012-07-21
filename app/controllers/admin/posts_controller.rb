class Admin::PostsController < ApplicationController
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
    @post = Post.new( params[:post] )
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
    text = params[:text] || ""
    rd = Redcarpet::Render::HTML.new(:hard_wrap=>true)
    md = Redcarpet::Markdown.new(rd, :autolink=>true)
    render :text => md.render(text)
  end
end
