# encoding : utf-8
class Post
  TECH = "技术"
  LIFE = "生活"
  CREATOR = "创业"
  include Mongoid::Document
  field :title, :type => String
  field :content, :type => String
  field :type, :type=> String
  field :visited_count, :type=>Integer, :default=>0

  has_many :comments

  validates :title, :presence=>true, :uniqueness=> true
  validates :content, :presence=>true, :length => { :minimum=> 30 }
  validates :type, :presence=>true, :inclusion => { :in => [ TECH, LIFE, CREATOR ] }
end
