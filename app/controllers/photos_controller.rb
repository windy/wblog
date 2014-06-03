class PhotosController < ApplicationController
  def create
    @photo = Photo.new(image: params["Filedata"])
    @photo.save!
    render :text=> md_url(@photo.image.url)
  end

  def md_url(url)
    "![](#{url})"
  end
end
