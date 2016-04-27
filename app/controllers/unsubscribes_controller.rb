class UnsubscribesController < ApplicationController
  def index
  end

  def new
    @subscribe = Subscribe.new
  end

  def create
    subscribe = Subscribe.find_or_initialize_by(email: params[:email])
    subscribe.enable = false
    subscribe.save

    flash[:notice] = "退订成功: #{params[:email]}"
    redirect_to unsubscribes_path
  end
end
