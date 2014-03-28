class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :image

  mount_uploader :image, PhotoUploader
end
