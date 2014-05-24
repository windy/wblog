class NewReplyPostWorker
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  def perform(comment_id)
    logger.info "new reply mail"
    comment = Comment.find(comment_id.to_s)
    comment.reply_emails.each do |email|
      next if email == ENV['ADMIN_USER']
      logger.info "new reply mail to #{email}"
      CommentMailer.reply(comment_id.to_s, email).deliver
    end
  end

end
