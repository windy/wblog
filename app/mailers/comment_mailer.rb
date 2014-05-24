class CommentMailer < ActionMailer::Base
  domain = ENV['DOMAIN_NAME'] || 'example.com'

  default from: "no-reply@#{domain}"

  def new(comment_id, to)
    @comment = Comment.find(comment_id)
    mail to: to, subject: '博主, 你的博客有新的评论'
  end

  def reply(comment_id, to)
    @comment = Comment.find(comment_id)
    mail to: to, subject: '客官, 你评论过的博客有新的回复'
  end
end
