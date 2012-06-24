class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, :type => String
  validates :content, presence: true
end
