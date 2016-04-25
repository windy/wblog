require 'rouge'
require 'rouge/plugins/redcarpet'

class CodeHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def initialize(extensions = {})
    super extensions.merge(link_attributes: { target: "_blank" })
  end
end
