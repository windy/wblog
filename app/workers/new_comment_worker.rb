class NewCommentWorker
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  def perform(name, content, title, to)
    logger.info "[mail] new comment mail: name=#{name}, content=#{content}, title=#{title}, to=#{to}"
    response = send_mail(name, content, title, to)
    logger.info "[mail] result is #{response}"
  ensure
    logger.info "[mail] new comment mail end: name=#{name}, content=#{content}, title=#{title}, to=#{to}"
  end

  def send_mail(name, content, title, to)
    response = RestClient.post "https://sendcloud.sohu.com/webapi/mail.send.xml",
      {
        :api_user => "postmaster@#{ENV['SENDCLOUD_USER']}.sendcloud.org",
        :api_key => ENV['SENDCLOUD_PASSWORD'],
        :from => ENV['SENDCLOUD_FROM'],
        :fromname => ENV['SENDCLOUD_FROMNAME'],
        :to => to,
        :subject => "你的博客又有新的评论",
        :html => <<-EOF
<p>很高兴的通知你, 你的博客有新的评论:</p>

<p>评论人: #{name}</p>

<p>评论内容: #{content}</p>

<p>被评论博客: #{title}</p>
        EOF
      }
    return response
  end
end

