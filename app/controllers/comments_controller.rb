class CommentsController < ApplicationController
  layout false
  helper_method :format_time
  def index
    @post = Post.find( params[:blog_id] )
    res = @post.comments.desc(:created_at).collect { |comment| build_json(comment) }
    render :json => res
  end

  def create
    @post = Post.find( params[:blog_id] )
    comment = @post.comments.build(comment_params)

    if comment.save
      render :json=> { success: true, data: build_json(comment) }
    else
      render :json=> { success: false, message: comment.errors.full_messages.join(", ") }
    end
  end

  private
  def comment_params
    params.permit(:content, :name, :email)
  end

  def build_json(comment)
    {
      content: comment.content,
      name: comment.name,
      'created_at' => format_time(comment.created_at)
    }
  end
end
