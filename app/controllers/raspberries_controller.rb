class RaspberriesController < ApplicationController
  require 'rpi_connection'
  layout 'user'
  expose(:raspberry)
  expose(:raspberries) { current_user.raspberries }

  def create
    flash[:danger] = 'No connection to your Raspberry.' unless hardware_info
    if raspberry.update(all_rpi_params)
      redirect_to raspberry
      flash[:success] = 'Raspberry successfully created.'
    else
      render :index
    end
  end

  private

  def hardware_info
    data = { action: 'rpi_activation' }
    rpi =  RpiConnection.new(rpi_params[:address], rpi_params[:port], data)
    response = rpi.request
    return nil unless response
    rpi_params[:serial] = response['serial']
    rpi_params[:version] = response['revision']
  end

  def rpi_params
    params.require(:raspberry)
  end

  def all_rpi_params
    params.require(:raspberry).permit!
  end
end
