class Admin::DashboardController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def index
  end
end
