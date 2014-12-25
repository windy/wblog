class HomeController < ApplicationController
  def index
  end

  def mobile
    render layout: false
  end
end
