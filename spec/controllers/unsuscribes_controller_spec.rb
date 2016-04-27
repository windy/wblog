require 'spec_helper'

describe UnsubscribesController do

  describe "POST 'create'" do
    it "unsuscribe ok" do
      subscribe = create(:subscribe, enable: true)
      post 'create', { subscribe: { email: subscribe.email } }
      expect(subscribe.reload.enable).to be(false)
    end
  end

end
