require 'spec_helper'

describe LikesController do

  it "get index" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    get 'index', blog_id: a.id
    expect(JSON.parse(response.body)['count']).to eq(0)
    a.likes << Like.new
    a.save!
    get 'index', blog_id: a.id
    expect(JSON.parse(response.body)['count']).to eq(1)
  end

  it "post create" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    post 'create', blog_id: a.id
    expect(a.likes.size).to eq(1)
  end

  it "DELETE destroy" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    like = Like.new
    a.likes << like
    a.save!
    delete 'destroy', blog_id: a.id, id: like.id
    expect(a.reload.likes.size).to eq(0)
  end
end
