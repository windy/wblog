class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :image

  attr_accessible :image

  mount_uploader :image, PhotoUploader
end
