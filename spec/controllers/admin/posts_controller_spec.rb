require 'spec_helper'

describe Admin::PostsController do
  it "preview should return ok" do
    post :preview
    response.body.should == ""
    post :preview, content: '123'
    response.body.should == "<p>123</p>\n"
  end
end
