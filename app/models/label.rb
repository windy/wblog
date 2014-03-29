class Label
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, :type => String

  has_and_belongs_to_many :post

  validates :type, presence: true
end
