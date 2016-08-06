require 'rails_helper'

RSpec.describe Post, type: :model do
  it "validates should be ok" do
    expect(create(:post)).to be_truthy
  end
end
