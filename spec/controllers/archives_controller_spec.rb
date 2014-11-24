require 'spec_helper'

describe ArchivesController do

  def posts_data(response)
    JSON.parse(response.body)["posts"]
  end

  describe "GET 'index'" do
    it "json" do
      get 'index', format: :json
      expect(posts_data(response).size).to eq(0)
    end

    it "add ten" do
      posts = create_list(:post_list, 10)
      get 'index', format: :json
      expect(posts_data(response).size).to eq(10)
    end

    it "add 20" do
      posts = create_list(:post_list, 20)
      get 'index', format: :json
      expect(posts_data(response).size).to eq(10)
    end

    it "type filter" do
      posts = create_list(:post_list, 20)
      life_posts = create_list(:post_list, 5, type: Post::LIFE)
      get 'index', type: 'life', format: :json
      expect(posts_data(response).size).to eq(5)
    end

    it "start_with filter" do
      posts = create_list(:post_list, 10)
      start_with = posts[4].created_at.to_i.to_s
      get 'index', start_with: start_with, format: :json
      expect(posts_data(response).size).to eq(5)
    end

    it "load_more" do
      posts = create_list(:post_list, 20)
      get 'index', format: :json
      start_with = JSON.parse(response.body)['start_with']
      expect(start_with).to eq( posts[9].created_at.to_i.to_s )
    end
  end

end
