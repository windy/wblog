class ArchivesController < ApplicationController
  def index
    type = map[archive_params[:type]]
    limit = 10
    start_with = archive_params[:start_with]
    @posts = Post.limit(limit).desc(:created_at)
    if type
      @posts = @posts.where(type: type)
    end

    if start_with
      @posts = @posts.where(:created_at.lt => Time.at(start_with.to_i))
    end

    #update start_with
    unless @posts.empty?
      start_with = @posts[-1].created_at.to_i.to_s
    end

    respond_to do |format|
      format.json do
        render :json => { 
          posts: @posts.collect { |post| build_summary(post) },
          start_with: start_with
        }
      end
      format.html
    end
  end

  def archive_params
    params.permit(:type, :start_with)
  end

  private
  def map
  {
    "life"=> "生活",
    "tech"=> "技术",
    "creator"=> "创业"
  }
  end

  def archive_params
    params.permit(:type, :start_with, :format)
  end

  def build_summary(post)
    {
      title: post.title,
      type: post.type,
      created_at: format_date(post.created_at),
      id: post.id.to_s,
      liked_count: post.liked_count,
      visited_count: post.visited_count,
      labels: post.labels_content
    }
  end
end
