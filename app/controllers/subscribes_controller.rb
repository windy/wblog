class SubscribesController < ApplicationController

  def index
  end

  def new
    @subscribe = Subscribe.new
  end

  def create
    @subscribe = Subscribe.find_or_initialize_by(email: subscribe_params[:email])
    @subscribe.enable = true

    if @subscribe.save
      redirect_to subscribes_path, notice: '订阅成功'
    else
      render :new
    end
  end

  def subscribe_params
    params.require(:subscribe).permit(:email)
  end

end
