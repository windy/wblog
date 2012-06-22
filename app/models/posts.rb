class Posts
  include Mongoid::Document
  field :title, :type => String
  field :content, :type => String
  field :type, :type => String
end
