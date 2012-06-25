require 'spec_helper'

describe Admin::PostsController do
  it "preview should return ok" do
    post :preview
    response.body.should == ""
    post :preview, text: '123'
    response.body.should == "<p>123</p>\n"
    post :preview, text: <<-EOF
```ruby
puts 'hello world'
```
EOF
    response.body.should == "<p><code>ruby<br>\nputs &#39;hello world&#39;<br>\n</code></p>\n"
  end
end
