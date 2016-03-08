class RaspberriesController < ApplicationController
  layout 'user'
  expose(:raspberry)
  expose(:raspberries) { current_user.raspberries }

  private

  def hardware_info
    data = { action: 'rpi_activation' }
    rpi =  RpiConnectio.new(params[:address], params[:port], data)
    response = rpi.request
    params[:serial] = response[:serial]
    params[:version] = response[:revision]
  end
end
