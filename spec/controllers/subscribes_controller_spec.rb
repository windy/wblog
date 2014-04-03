require 'spec_helper'

describe SubscribesController do

  describe "POST 'create'" do
    it "post ok" do
      post 'create', email: 'tester@test.com'
      expect(JSON.parse(response.body)['success']).to be_true
      expect(Subscribe.all.size).to eq(1)
    end

    it "post with disabled email" do
      subscribe = Subscribe.create(email: 'tester@test.com', enable: false)
      post 'create', email: 'tester@test.com'
      expect(JSON.parse(response.body)['success']).to be_true
      expect(subscribe.reload.enable).to be_true
    end
  end

end
