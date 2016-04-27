class UnsubscribesController < ApplicationController
  def index
  end

  def new
    @subscribe = Subscribe.new
  end

  def create
    subscribe = Subscribe.find_or_initialize_by(email: subscribe_params[:email])
    subscribe.enable = false
    subscribe.save

    flash[:notice] = "退订成功: #{subscribe_params[:email]}"
    redirect_to unsubscribes_path
  end

  def subscribe_params
    params.require(:subscribe).permit(:email)
  end
end
