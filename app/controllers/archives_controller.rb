class ArchivesController < ApplicationController
  def index
    @posts = Post.all
  end

  def archive_params
    params.permit(:type)
  end
end
