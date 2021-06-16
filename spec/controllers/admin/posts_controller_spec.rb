require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do

  before do
    session[:login] = true
  end
  it "preview should return ok" do
    post :preview
    expect(response.body).to eq("")
    post :preview, params: { content: '123' }
    expect(response.body).to eq("<p>123</p>\n")
  end

  it "update" do
    post = create(:post)

    patch 'update', params: { id: post.id, labels: 'think, go ' }
    expect(post.reload.labels.size).to eq(2)
  end


  it "destroy" do
    post = create(:post)
    label = create(:label)
    post.labels << label
    post.save!
    expect(label.posts.size).to eq(1)

    delete 'destroy', params: { id: post.id }
    expect( Post.all.size ).to eq(0)
    expect( label.reload.posts.size ).to eq(0)
  end

  it "create" do
    post_params = attributes_for(:post)
    post 'create', params: post_params.merge( labels: 'think, go ' )

    post = Post.first
    expect( post.labels.size ).to eq(2)
  end

  it "create fail and see labels_content" do
    post 'create', params: { labels: 'think, go ' }
    expect( assigns(:post).labels_content ).to eq('think, go')
  end
end
