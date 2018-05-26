class ArchivesController < ApplicationController
  def index
    if (@q = params[:q]).blank?
      @posts = Post.order(created_at: :desc).page(params[:page])
    else
      @q_size = Post.where('title like ?', "%#{@q}%").size
      @posts = Post.where('title like ?', "%#{@q}%").order(created_at: :desc).page(params[:page])
    end
  end
end
