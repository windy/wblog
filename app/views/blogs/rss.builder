xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do

   xml.title       ENV['SITE_NAME']
   xml.link        url_for :only_path => false, :controller => 'blogs'
   xml.description ENV['INTRODUCE'].presence || ENV['SITE_NAME']

   @posts.each do |post|
     xml.item do
       xml.title       post.title
       xml.link        blog_url(post)
       xml.description post.content_html
       xml.guid        blog_url(post)
     end
   end

 end
end
