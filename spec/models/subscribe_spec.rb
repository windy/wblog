require 'spec_helper'
describe Subscribe do
  it "validates should be ok" do
    expect(create(:subscribe)).to be_true
  end

  it 'uniqueness' do
    create(:subscribe)
    two = build(:subscribe)
    expect(two.save).to be_false
  end

  it "default is true" do
    subscribe = Subscribe.create(email: 'a@b')
    expect(subscribe.enable).to be_true
  end

  it "subscribe_list" do
    subscribe = Subscribe.create(email: 'a@b')
    subscribe = Subscribe.create(email: 'a1@b')
    expect(Subscribe.subscribe_list.split(';').size).to eq(2)
  end
end
