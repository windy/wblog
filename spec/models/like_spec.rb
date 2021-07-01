require 'rails_helper'

RSpec.describe Like, type: :model  do
  it "add like" do
    a = Post.create!(title: 'one', content: '1'*31)
    like = Like.new
    like.post = a
    expect(like.save).to eq(true)
  end
end
