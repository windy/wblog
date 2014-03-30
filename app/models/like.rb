class Like
  include Mongoid::Document

  belongs_to :post
  validates_presence_of :post_id
end
