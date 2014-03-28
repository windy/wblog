require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to redirect_to("http://who.yafeilee.me")
    end
  end

end
