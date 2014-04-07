class NewPostWorker
  include Sidekiq::Worker

  sidekiq_retry_in do |count|
    3
  end

  def perform(title, to)
    logger.info "[mail] new post mail: title=#{title}, to=#{to}"
    response = send_mail(title, to)
    logger.info "[mail] result is #{response}"
  ensure
    logger.info "[mail] new post mail end: title=#{title}, to=#{to}"
  end

  def send_mail(title, to)
    response = RestClient.post "https://sendcloud.sohu.com/webapi/mail.send.xml",
      {
        :api_user => "postmaster@#{ENV['SENDCLOUD_USER']}.sendcloud.org",
        :api_key => ENV['SENDCLOUD_PASSWORD'],
        :from => ENV['SENDCLOUD_FROM'],
        :fromname => ENV['SENDCLOUD_FROMNAME'],
        :to => to,
        :subject => "#{ENV['SITE_NAME']} 又写了新博客",
        :html => <<-EOF
<p>hi, 我是李亚飞, 很高兴告诉你:</p>

<p>#{ENV['SITE_NAME']} 新博客到了: #{title}</p>

<p>具体内容请访问: http://yafeilee.me</p>

<p>&nbsp;</p>

<p>---------- 退订地址请点击:</p>

<p><a href="http://yafeilee.me/unsubscribe?id=5F46EF">点此退订</a></p>
        EOF
      }
    return response
  end
end

