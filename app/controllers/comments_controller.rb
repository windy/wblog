class CommentsController < ApplicationController
  layout false

  def index
    @post = Post.find( params[:blog_id] )
    res = @post.comments.desc(:created_at).collect { |comment| build_json(comment) }
    render :json => res
  end

  def create
    unless request.xhr?
      logger.warn "attack action detected: #{params.to_h}"
      redirect_to root_path
      return
    end
    cookies[:name] = comment_params[:name]
    cookies[:email] = comment_params[:email]
    @post = Post.find( params[:blog_id] )
    @comment = @post.comments.build(comment_params)

    if @comment.save
      @comments = @post.comments.order(created_at: :desc)
      ActionCable.server.broadcast "comment_post_#{@comment.post.id}", { not: cookies[:cable_id] }
      render :create_ok
    else
      render :create_fail
    end
  end

  def refresh
    @post = Post.find(params[:blog_id])
    @comments = @post.comments.order(created_at: :desc)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :name, :email)
  end

  def build_json(comment)
    {
      content: comment.content,
      name: comment.name,
      'created_at' => format_time(comment.created_at)
    }
  end
end
