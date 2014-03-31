class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :format_time, :format_date

  def format_time(time)
    time.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(time)
    time.strftime("%Y.%m.%d")
  end
end
