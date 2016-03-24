class RpiRequest
  def initialize(host, port, path, params: nil)
    @host = host
    @port = port
    @path = path
    @params = params
  end

  def request
    HTTP.get("http://#{@host}:#{@port}#{@path}", json: @params).parse
  rescue
    nil
  end
end
