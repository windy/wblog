require 'rails_helper'

RSpec.describe UnsubscribesController, type: :controller do

  describe "POST 'create'" do
    it "unsuscribe ok" do
      subscribe = create(:subscribe, enable: true)
      post 'create', params: { subscribe: { email: subscribe.email } }
      expect(subscribe.reload.enable).to be(false)
    end
  end

end
