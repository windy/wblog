require 'rails_helper'

RSpec.describe Admin::SubscribesController, :type => :controller do

  before do
    session[:login] = true
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST enable" do
    it "returns http success" do
      subscribe = create(:subscribe)
      post :enable, params: { id: subscribe.id }
      expect(subscribe.reload.enable).to eq(true)
    end
  end

  describe "POST disable" do
    it "returns http success" do
      subscribe = create(:subscribe, enable: true)
      post :disable, params: { id: subscribe.id }
      expect(subscribe.reload.enable).to eq(false)
    end
  end

end
