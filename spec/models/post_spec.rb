require 'spec_helper'

describe Post do
  it "validates should be ok" do
    a = Post.create!(title: 'one', content: '1'*31, type: Post::TECH )
    a.save.should == true
  end
end
