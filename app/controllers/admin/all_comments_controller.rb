class Admin::AllCommentsController < Admin::BaseController
  def index
    @comments = Comment.order(created_at: :desc).page(params[:page]).per(25)
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:notice] = '删除评论成功'
      redirect_to admin_all_comments_path
    else
      flash[:alert] = '删除失败'
      redirect_to admin_all_comments_path
    end
  end
end
