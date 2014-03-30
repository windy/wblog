require 'spec_helper'

describe Like do
  it "add like" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    like = Like.new
    like.post = a
    expect(like.save).to eq(true)
  end
end
