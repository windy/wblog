require 'spec_helper'

describe Post do
  it "validates should be ok" do
    expect(create(:post)).to be_truthy
  end
end
