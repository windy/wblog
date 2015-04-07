class Admin::SessionsController < ApplicationController
  layout 'layouts/admin'

  def new
  end

  def create
    if ENV['ADMIN_USER'].blank?
      render :json=> { success: false, message: t('session.no_configuration') }
    elsif ENV['ADMIN_USER'] != params[:username]
      render :json=> { success: false, message: t('session.username_error') }
    elsif ENV['ADMIN_PASSWORD'] != params[:password]
      render :json=> { success: false, message: t('session.password_error') }
    else
      flash[:notice] = t('session.login_success')
      session[:login] = true
      render :json=> { success: true }
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_admin_session_path
  end
end
