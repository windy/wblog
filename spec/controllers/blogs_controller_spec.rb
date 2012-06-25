require 'spec_helper'

describe BlogsController do

  it 'index should get by order desc' do
    a = Post.new(title: '123', content: '123'*20, type: Post::TECH)
    a.save!
    sleep 1
    b = Post.new(title: '1234', content: '123'*20,type: Post::TECH)
    b.save!
    get :index
    assigns[:posts][1].title.should == a.title
  end
end
