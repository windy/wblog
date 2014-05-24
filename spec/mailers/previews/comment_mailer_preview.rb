class CommentMailerPreview < ActionMailer::Preview
  def new
    CommentMailer.new(Comment.first, 'test@example.org')
  end

  def reply
    CommentMailer.reply(Comment.first, 'test@example.org')
  end
end
