class ArchivesController < ApplicationController
  def index
    type = map[params[:type]]
    limit = 10
    start_with = params[:start_with]
    @posts = Post.desc(:created_at)

    if type
      @posts = @posts.where(type: type)
      @type = type
    end

    # all 与 start_with 参数同在, 说明是要获取所有start_with之前的数据
    if params[:all] and params[:start_with]
      @posts = @posts.where(:created_at.gte => Time.at(start_with.to_i))
    else
      @posts = @posts.limit(limit)
    end

    if !params[:all] and start_with
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

  private
  def map
  {
    "life"=> "生活",
    "tech"=> "技术",
    "creator"=> "创业"
  }
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
