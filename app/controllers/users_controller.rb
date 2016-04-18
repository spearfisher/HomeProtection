class UsersController < ApplicationController
  expose(:raspberry) { raspberries.first }
  expose(:raspberries) { current_user.raspberries }
  expose(:climate_sensors) { raspberry.climate_sensors }
  expose(:climate_logs) { raspberry.climate_logs.today }
  include RpiInfo
  layout 'user'

  def show
    redirect_to raspberries_path unless raspberry
    @stream_token = stream_token if raspberry
  end

  private

  def temp_hash(logs)
    hash = {}
    logs.each { |log| hash.merge! log.datetime => log.temp }
    hash
  end

  def rh_hash(logs)
    hash = {}
    logs.each { |log| hash.merge! log.datetime => log.humidity }
    hash
  end

  def chart_data(sensor)
    # TODO: add scope for one db query
    logs = sensor.climate_logs.today
    [{ name: "#{sensor.name} - Temperature", data: temp_hash(logs) },
     { name: "#{sensor.name} - Humidity", data: rh_hash(logs) }]
  end
  helper_method :chart_data
end
