class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :content, :type => String
  field :email,	:type=>String

  belongs_to :post

  validates :name, presence: true
  validates :email, confirmation: true,:format => /@/
  validates :content, presence: true
end
