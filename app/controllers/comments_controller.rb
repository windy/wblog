class CommentsController < ApplicationController
  layout false

  def create
    cookies[:name] = comment_params[:name]
    cookies[:email] = comment_params[:email]

    @post = Post.find( params[:blog_id] )
    @comments = @post.comments.order(created_at: :desc)

    # # 某些原因暂时关闭评论
    flash.now[:notice] = '评论功能未开放'
    return

    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash.now[:notice] = '发表成功'
      # 重置评论
      @comment = Comment.new
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
end
