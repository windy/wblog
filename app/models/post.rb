# encoding : utf-8
class Post
  TECH = "技术"
  LIFE = "生活"
  CREATOR = "创业"
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Pagination
  field :title, :type => String
  field :content, :type => String
  field :type, :type=> String
  field :visited_count, :type=>Integer, :default=>0

  has_many :comments
  has_and_belongs_to_many :labels

  validates :title, :presence=>true, :uniqueness=> true
  validates :content, :presence=>true, :length => { :minimum=> 30 }
  validates :type, :presence=>true, :inclusion => { :in => [ TECH, LIFE, CREATOR ] }

  def content_html
    rd = Redcarpet::Render::HTML.new(:hard_wrap=>true)
    md = Redcarpet::Markdown.new(rd, :autolink=>true)
    md.render(self.content)
  end

  def visited
    self.visited_count += 1
    self.save
    self.visited_count
  end

  def sub_content
    rd = Redcarpet::Render::HTML.new(:hard_wrap=>true)
    md = Redcarpet::Markdown.new(rd, :autolink=>true)
    sub_cont = md.render(self.content)
    HTML_Truncator.truncate(sub_cont,100)
  end
end
