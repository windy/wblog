require 'spec_helper'

describe SubscribesController do

  describe "POST 'create'" do
    it "post ok" do
      post 'create', email: 'tester@test.com'
      expect(JSON.parse(response.body)['success']).to be_truthy
      expect(Subscribe.all.size).to eq(1)
    end

    it "post with disabled email" do
      subscribe = Subscribe.create(email: 'tester@test.com', enable: false)
      post 'create', email: 'tester@test.com'
      expect(JSON.parse(response.body)['success']).to be_truthy
      expect(subscribe.reload.enable).to be_truthy
    end
  end

end
