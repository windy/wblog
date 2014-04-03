class Admin::SessionsController < ApplicationController
  layout 'layouts/admin'

  def new
  end

  def create
    if ENV['ADMIN_USER'].blank?
      render :json=> { success: false, message: '系统未配置管理员账户, 无法登录' }
    elsif ENV['ADMIN_USER'] != params[:username]
      render :json=> { success: false, message: '管理员账户错误' }
    elsif ENV['ADMIN_PASSWORD'] != params[:password]
      render :json=> { success: false, message: '管理员密码错误' }
    else
      flash[:notice] = '登录成功'
      session[:login] = true
      render :json=> { success: true }
    end
  end

  def destroy
    session[:login] = nil
    redirect_to new_admin_session_path
  end
end
