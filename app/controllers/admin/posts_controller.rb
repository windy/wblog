class Admin::PostsController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find( params[:id] )
  end

  def show
    post = Post.find( params[:id] )
    render :json=> {
      title: post.title,
      type: post.type,
      labels: post.labels_content(true),
      content: post.content
    }
  end

  def destroy
    @post = Post.find( params[:id] )
    if @post.destroy
      flash[:notice] = '删除博客成功'
      redirect_to admin_posts_path
    else
      flash[:error] = '删除博客失败'
      redirect_to admin_posts_path
    end
  end

  def index
    @posts = Post.desc(:created_at)
  end

  def create
    labels = params.delete(:labels).to_s
    @post = Post.new( params.permit(:title, :content, :type) )
    initialize_or_create_labels(labels)

    if @post.save
      flash[:notice] = '创建博客成功'
      redirect_to admin_posts_path
    else
      flash.now[:error] = '创建失败'
      render :new
    end
  end

  def update
    @post = Post.find( params[:id] )

    labels = params.delete(:labels).to_s
    initialize_or_create_labels(labels)

    if @post.update( params.permit(:title, :content, :type) )
      flash[:notice] = '更新博客成功'
      redirect_to admin_posts_path
    else
      flash[:error] = '更新博客失败'
      render :edit
    end
  end

  def preview
    render plain: Post.render_html(params[:content] || "")
  end

  private
  def initialize_or_create_labels(labels)
    @post.labels = []
    labels.split(",").each do |name|
      label = Label.find_or_initialize_by(name: name.strip)
      label.save!
      @post.labels << label
    end
  end
end
