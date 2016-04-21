class UsersController < ApplicationController
  expose(:raspberry) { raspberries.first }
  expose(:raspberries) { current_user.raspberries }
  expose(:climate_sensors) { raspberry.climate_sensors.eager_load(:climate_logs).where('datetime > ?', range) }
  include RpiInfo
  layout 'user'

  def show
    redirect_to raspberries_path unless raspberry
    @stream_token = stream_token if raspberry
  end

  private

  def climate_hash(logs, characteristic)
    hash = {}
    logs.each { |log| hash.merge! log.datetime => log.send(characteristic) }
    hash
  end

  def chart_data(sensor)
    logs = sensor.climate_logs
    [{ name: "#{sensor.name} - Temperature", data: climate_hash(logs, :temp) },
     { name: "#{sensor.name} - Humidity", data: climate_hash(logs, :humidity) }]
  end
  helper_method :chart_data

  def climate_range_hash
    { 'Today' => Date.today,
      'Last week' => 1.week.ago,
      'Last month' => 1.month.ago }
  end
  helper_method :climate_range_hash

  def range
    return Date.today unless params[:range]
    climate_range_hash[params[:range]]
  end
end
