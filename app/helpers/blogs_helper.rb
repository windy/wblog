module BlogsHelper
  def format_time(time)
    time.strftime("%Y-%m-%d %H:%M")
  end
end
