require 'spec_helper'

describe BlogsController do

  describe 'get INDEX' do
    it 'index should get by order desc' do
      create_list(:post_list, 5)

      first = Post.first
      first.update(title: 'first')

      second = Post.desc(:created_at)[1]
      get :index
      expect(assigns(:newest)).to eq(first)
      expect(assigns(:recent)[0]).to eq(second)
    end
  end

  describe "get SHOW" do

    it 'get POST' do
      post = create(:post)
      comment1 = build(:comment_no_post)
      comment1.post = post
      comment1.save!
      comment2 = build(:comment_no_post)
      comment2.post = post
      comment2.save!

      get :show, id: post.id
      expect(assigns(:comments)[0]).to eq(comment1)
      expect(assigns(:comments)[1]).to eq(comment2)
    end

    it "#prev, #next" do
      posts = create_list(:post_list, 3)
      posts = Post.order_by(created_at: 'asc')
      selected = posts[1]
      s_prev = posts[0]
      s_next = posts[2]
      get :show, id: selected.id
      expect(assigns(:prev)).to eq(s_prev)
      expect(assigns(:next)).to eq(s_next)

      # 下界
      selected = posts[0]
      get :show, id: selected.id
      expect(assigns(:prev)).to be_nil
      expect(assigns(:next)).to eq(posts[1])

      # 测试上界
      selected = posts[2]
      get :show, id: selected.id
      expect(assigns(:prev)).to eq(posts[1])
      expect(assigns(:next)).to be_nil

      # 测试未来时间
      create(:post, created_at: Time.now + 100)
      selected = posts[1]
      get :show, id: selected.id
      expect(assigns(:prev)).to eq(posts[0])
      expect(assigns(:next)).to eq(posts[2])
    end
  end
end
