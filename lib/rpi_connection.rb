class RpiConnection
  def initialize(host, port, message)
    @host = host
    @port = port
    @message = message.to_json
  end

  def request
    Socket.tcp(@host, @port) do |sock|
      sock.print(@message)
      JSON.parse(sock.read)
    end
  rescue
    nil
  end
end
