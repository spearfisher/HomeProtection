module RpiInfo
  require 'rpi_request'

  def hardware_info
    data = { action: 'rpi_activation' }
    rpi =  RpiRequest.new(rpi_params[:address], rpi_params[:port], data)
    response = rpi.request
    return nil unless response
    rpi_params[:serial] = response['serial']
    rpi_params[:version] = response['revision']
  end

  def connection_test(raspberry)
    data = { action: 'ping' }
    rpi = RpiRequest.new(raspberry.address, raspberry.port, data)
    return nil unless rpi.request
    rpi.request['message']
  end
end
