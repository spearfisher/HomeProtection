class RpiRequest
  def initialize(url, path, secret: '', params: nil)
    @url = url
    @path = path
    @secret = secret
    @params = params
  end

  def request
    HTTP.get("#{@url}#{@path}", json: @params).parse
  rescue
    nil
  end

  def post_request
    return nil unless sanitaze_params
    @connection = HTTP.persistent @url
    @connection.headers(token: token).post(@path, json: @params).parse
  rescue HTTP::ConnectionError
    nil
  ensure
    @http.close if @http
  end

  private

  def fetch_salt
    @connection.get('/api/salt').parse['salt']
  end

  def sanitaze_params
    URI.parse(@url).host
  end

  def token
    BCrypt::Engine.hash_secret(@secret, fetch_salt)
  end
end
