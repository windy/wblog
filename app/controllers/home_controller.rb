class HomeController < ApplicationController
  def index
    @newest = Post.order(created_at: :desc).first
    @recent = Post.order(created_at: :desc).to_a[1..3]
  end

  def about
  end

  def changelog
  end
end