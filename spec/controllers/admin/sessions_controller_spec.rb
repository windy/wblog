require 'spec_helper'

describe Admin::SessionsController do

  before do
    session[:login] = true
  end
  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

end
