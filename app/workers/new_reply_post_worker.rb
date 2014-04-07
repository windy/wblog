class NewReplyPostWorker
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  # name: 评论人名字
  # title: 博客标题
  # content: 回复内容
  # id: 博客id
  # to: 邮件递送人
  def perform(name, title, content, id, to)
    logger.info "[mail] new reply mail: title=#{title}, content=#{content}, to=#{to}"
    response = send_mail(name, title, content, id, to)
    logger.info "[mail] result is #{response}"
  ensure
    logger.info "[mail] new reply mail end: title=#{title}, content=#{content}, to=#{to}"
  end

  def send_mail(name, title, content, id, to)
    response = RestClient.post "https://sendcloud.sohu.com/webapi/mail.send.xml",
      {
        :api_user => "postmaster@#{ENV['SENDCLOUD_USER']}.sendcloud.org",
        :api_key => ENV['SENDCLOUD_PASSWORD'],
        :from => ENV['SENDCLOUD_FROM'],
        :fromname => ENV['SENDCLOUD_FROMNAME'],
        :to => to,
        :subject => "博客回复通知",
        :html => <<-EOF
<p>#{name}, 你好:</p>

<p>你回复过的博客有新的回复:</p>

<p>博客标题: #{title}</p>

<p>回复内容: #{content[0..20]}...</p>

<p>&nbsp;</p>

<p>详细链接: <a href="http://yafeilee.me/blogs/#{id}">#{title}</a></p>

<p>---------- 退订地址请点击:</p>

<p><a href="http://yafeilee.me/unsubscribe?id=5F46EF">点此退订</a></p>
        EOF
      }
    return response
  end

end
