require 'spec_helper'

describe Comment do
  it 'test comment' do
    a = Comment.new(name: '1',content: '2432423',email: '22@.com', post_id: 1)
    a.save.should == true
    b = Comment.new(content: '2432ddd423',email: '22@.com', post_id: 1)
    b.save.should == false
    b = Comment.new(name: '2', email: '22@.com', post_id: 1)
    b.save.should == false
    b = Comment.new(name: '2', content: '2432ddd423',email: '22.com', post_id: 1)
    b.save.should == false
  end
end
