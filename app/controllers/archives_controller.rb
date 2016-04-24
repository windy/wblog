class ArchivesController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end
end
