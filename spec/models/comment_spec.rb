require 'spec_helper'

describe Comment do
  it "comment should not blank" do
    a = Comment.new
    a.save.should == false
    a = Comment.new(content: '11')
    a.save.should == true
  end
end
