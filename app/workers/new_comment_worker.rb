class NewCommentWorker
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  def perform(comment_id, to)
    logger.info "new comment mail: #{comment_id}"
    CommentMailer.new(comment_id.to_s, to).deliver
  end
end

