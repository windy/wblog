module ApplicationHelper
  # some format function is defined in app/controllers/application_controller.rb
  #
  def search_highlight(title, q)
    return title if q.blank?

    title.sub(q, "<em>#{q}</em>")
  end
end
