class Admin::SubscribesController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def index
    @subscribes = Subscribe.all.order(created_at: :desc).page(params[:page]).per(25)
  end

  def enable
    @subscribe = Subscribe.find(params[:id])

    @subscribe.enable = true
    @subscribe.save!

    redirect_to admin_subscribes_path, notice: "#{@subscribe.email} is enabled!"
  end

  def disable
    @subscribe = Subscribe.find(params[:id])

    @subscribe.enable = false
    @subscribe.save!

    redirect_to admin_subscribes_path, notice: "#{@subscribe.email} is disabled!"
  end
end
