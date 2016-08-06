require 'rails_helper'

RSpec.describe Admin::SessionsController, type: :controller do

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
