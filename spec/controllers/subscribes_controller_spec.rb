require 'rails_helper'

RSpec.describe SubscribesController, type: :controller do

  describe "POST 'create'" do
    it "post ok" do
      post 'create', params: { subscribe: { email: 'tester@test.com' } }
      expect(Subscribe.all.size).to eq(1)
    end

    it "post with disabled email" do
      subscribe = Subscribe.create(email: 'tester@test.com', enable: false)
      post :create, params: { subscribe: { email: 'tester@test.com' } }
      expect(subscribe.reload.enable).to be_truthy
    end
  end

end
