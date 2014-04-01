class Subscribe
  include Mongoid::Document
  field :email, type: String
  field :enable, type: Mongoid::Boolean, default: true

  validates :email, presence: true, format: /@/

  def self.subscribe_list
    Subscribe.all.map(&:email).join(";")
  end
end
