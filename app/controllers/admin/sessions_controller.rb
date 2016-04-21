class Admin::SessionsController < ApplicationController
  layout 'layouts/admin'

  def new
  end

  def create
    if ENV['ADMIN_USER'].blank?
      flash.now[:alert] = t('admin.session.no_configuration')
      render :new
    elsif ENV['ADMIN_USER'] != params[:username]
      flash.now[:alert] = t('admin.session.username_error')
      render :new
    elsif ENV['ADMIN_PASSWORD'] != params[:password]
      flash.now[:alert] = t('admin.session.password_error')
      render :new
    else
      flash[:notice] = t('admin.session.login_success')
      session[:login] = true
      redirect_to admin_root_path
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_admin_session_path
  end
end
