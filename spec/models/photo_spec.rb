require 'spec_helper'

describe Photo do
  it "photo with picture will be ok" do
    a = Photo.new
    a.save
  end
end
