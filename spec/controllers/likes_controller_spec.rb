require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  it "get index" do
    a = Post.create!(title: 'one', content: '1'*31)
    get 'index', params: { blog_id: a.id }
    expect(JSON.parse(response.body)['count']).to eq(0)
    a.likes << Like.new
    a.save!
    get 'index', params: { blog_id: a.id }
    expect(JSON.parse(response.body)['count']).to eq(1)
  end

  it "post create" do
    a = Post.create!(title: 'one', content: '1'*31)
    post 'create', params: { blog_id: a.id }
    expect(a.likes.size).to eq(1)
  end

  it "DELETE destroy" do
    a = Post.create!(title: 'one', content: '1'*31)
    like = Like.new
    a.likes << like
    a.save!
    delete 'destroy', params: { blog_id: a.id, id: like.id }
    expect(a.reload.likes.size).to eq(0)
  end
end
