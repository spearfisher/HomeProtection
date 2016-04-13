class ClimateSensorsController < ApplicationController
  expose(:climate_sensor)
  def create
    if climate_sensor.update(sensor_params)
      flash[:success] = 'Sensor successfully created.'
    else
      flash[:warning] = climate_sensor.errors.first.last
    end
  end

  def destroy
    flash[:success] = 'Successfully removed.' if climate_sensor.destroy
    redirect_via_turbolinks_to raspberries_path
  end

  private

  def sensor_params
    params.require(:climate_sensor).permit!
  end
end
