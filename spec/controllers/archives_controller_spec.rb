require 'rails_helper'

RSpec.describe ArchivesController, type: :controller do

  it "get index" do
    create_list(:post_list, 3)
    get :index
    expect(response.status).to eq(200)
  end

end
