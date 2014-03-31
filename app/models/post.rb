# encoding : utf-8
#
require 'markdown'
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
  
  has_many :likes

  validates :title, :presence=>true, :uniqueness=> true
  validates :content, :presence=>true, :length => { :minimum=> 30 }
  validates :type, :presence=>true, :inclusion => { :in => [ TECH, LIFE, CREATOR ] }

  def content_html
    rd = CodeHTML.new
    md = Redcarpet::Markdown.new(rd, autolink: true, fenced_code_blocks: true)
    md.render(self.content)
  end

  def visited
    self.visited_count += 1
    self.save
    self.visited_count
  end

  def sub_content
    HTML_Truncator.truncate(content_html,100)
  end

  def labels_content
    content = self.labels.collect { |label| label.name }.join(", ")
    content = '无' if content.blank?
    content
  end

  def liked_count
    self.likes.size
  end
end
