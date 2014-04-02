class QrcodesController < ApplicationController
  def show
    str = params[:str].to_s
    max_length = 200
    if str.length > max_length
      render nothing: true, status: 404
      return
    end
    require 'rqrcode/export/png'
    qr = RQRCode::QRCode.new(str)
    response.headers['Cache-Control'] = "public, max-age=#{12.hours.to_i}"
    response.headers['Content-Type'] = 'image/png'
    response.headers['Content-Disposition'] = 'inline'
    render :text => qr.as_png
  end
end
