require 'spec_helper'

describe Admin::DashboardController do

  before do
    session[:login] = true
  end
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
