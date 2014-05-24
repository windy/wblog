class PostMailer < ActionMailer::Base
  domain = ENV['DOMAIN_NAME'] || 'example.com'

  default from: "no-reply@#{domain}"

  def new(post_id, to)
    @post = Post.find(post_id)
    mail to: to, subject: '客官, 新博客来了'
  end
end
