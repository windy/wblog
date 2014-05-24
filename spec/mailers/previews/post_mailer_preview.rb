class PostMailerPreview < ActionMailer::Preview
  def new
    PostMailer.new(Post.first, 'to@example.org')
  end
end
