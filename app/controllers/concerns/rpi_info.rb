module RpiInfo
  require 'rpi_request'

  def hardware_info
    path = '/api/activation'
    rpi =  RpiRequest.new(rpi_params[:address], rpi_params[:port], path)
    response = rpi.request
    return nil unless response
    rpi_params[:serial] = response['serial']
    rpi_params[:version] = response['revision']
  end

  def connection_test(raspberry)
    path = '/api/test'
    rpi = RpiRequest.new(raspberry.address, raspberry.port, path)
    return nil unless rpi.request
    rpi.request['message']
  end
end
