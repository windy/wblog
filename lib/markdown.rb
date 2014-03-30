require 'rouge'
require 'rouge/plugins/redcarpet'

class CodeHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
