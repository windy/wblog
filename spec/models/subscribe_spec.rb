require 'spec_helper'
describe Subscribe do
  it "validates should be ok" do
    expect(create(:subscribe)).to be_truthy
  end

  it 'uniqueness' do
    create(:subscribe)
    two = build(:subscribe)
    expect(two.save).to be_falsey
  end

  it "default is true" do
    subscribe = Subscribe.create(email: 'tester@test.com')
    expect(subscribe.enable).to be_truthy
  end

  it "subscribe_list" do
    subscribe = Subscribe.create(email: 'tester@test.com')
    subscribe = Subscribe.create(email: 'tester1@test.com')
    expect(Subscribe.subscribe_list.size).to eq(2)
  end

  it "unsubscribe?" do
    subscribe = Subscribe.create(email: 'tester@test.com', enable: false)
    expect(Subscribe.unsubscribe?('tester@test.com')).to be_truthy
  end
end
