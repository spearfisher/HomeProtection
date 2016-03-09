class RaspberriesController < ApplicationController
  require 'rpi_connection'
  layout 'user'
  expose(:raspberry)
  expose(:raspberries) { current_user.raspberries }

  def create
    hardware_info
    visit_via_turbolinks raspberry_path if raspberry.update(rpi_params.permit!)
  end

  private

  def hardware_info
    data = { action: 'rpi_activation' }
    rpi =  RpiConnection.new(rpi_params[:address], rpi_params[:port], data)
    response = rpi.request
    rpi_params[:serial] = response['serial']
    rpi_params[:version] = response['revision']
  end

  def rpi_params
    params[:raspberry]
  end
end
