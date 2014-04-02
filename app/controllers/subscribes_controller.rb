class SubscribesController < ApplicationController
  def create
    subscribe = Subscribe.find_or_initialize_by(email: params[:email])
    subscribe.enable = true

    if subscribe.save
      render :json => { success: true }
    else
      render :json => { success: false, message: subscribe.errors.full_messages.join(", ")}
    end
  end

  def destroy
    if subscribe = Subscribe.where(email: params[:email]).first
      subscribe.enable = false
      subscribe.save
    end

    render :json => { success: true }
  end
end
