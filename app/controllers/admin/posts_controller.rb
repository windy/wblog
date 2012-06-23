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
      redirect_to :action=>:index
    else
      flash[:alert] = "fail!"
      render :action=>:new
    end
  end

  def update
  end

  def preview
    text = params[:text] || ""
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink=>true)
    render :text => md.render(text)
  end
end
