require 'spec_helper'

describe LikesController do

  it "get index" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    get 'index', blog_id: a.id
    JSON.parse(response.body)['count'].should == 0
    a.likes << Like.new
    a.save!
    get 'index', blog_id: a.id
    JSON.parse(response.body)['count'].should == 1
  end

  it "post create" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    post 'create', blog_id: a.id
    a.likes.size.should == 1
  end

  it "DELETE destroy" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    like = Like.new
    a.likes << like
    a.save!
    delete 'destroy', blog_id: a.id, id: like.id
    a.reload.likes.size.should == 0
  end
end
