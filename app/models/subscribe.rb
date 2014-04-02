class Subscribe
  include Mongoid::Document
  field :email, type: String
  field :enable, type: Mongoid::Boolean, default: true

  validates :email, presence: true, uniqueness: true, format: /@/

  def self.subscribe_list
    Subscribe.all.where(enable: true).map(&:email).join(";")
  end
end
