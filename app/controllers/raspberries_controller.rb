class RaspberriesController < ApplicationController
  include RpiInfo
  layout 'user'
  expose(:raspberry)
  expose(:raspberries) { current_user.raspberries }

  def test
    if connection_test == 'OK'
      flash[:info] = 'Online'
    else
      flash[:danger] = 'Offline'
    end
  end

  def create
    flash[:danger] = 'No connection to your Raspberry.' unless fetch_hardware_info
    if raspberry.update(rpi_params.permit!)
      flash[:success] = 'Raspberry successfully created.'
    else
      flash[:warning] = raspberry.errors.first.last
    end
    redirect_to raspberries_path
  end

  def update
    flash[:success] = 'Successfully updated!'
    raspberry.update(rpi_params.permit!)
  end

  def destroy
    flash[:success] = 'Successfully removed.' if raspberry.destroy
    redirect_via_turbolinks_to raspberries_path
  end

  private

  def rpi_params
    params.require(:raspberry)
  end
end
