class RpiRequest
  def initialize(url, path, secret = '', params = nil)
    @url = url
    @path = path
    @secret = secret
    @params = params
  end

  def request
    HTTP.get("#{@url}#{@path}", params: @params).parse
  rescue
    nil
  end

  def post_request
    return nil unless sanitaze_url
    @connection = HTTP.persistent @url
    @connection.headers(token: token).post(@path, params: @params).parse
  rescue HTTP::ConnectionError
    nil
  ensure
    @http.close if @http
  end

  private

  def fetch_salt
    @connection.get('/api/salt').parse['salt']
  end

  def sanitaze_url
    URI.parse(@url).host
  end

  def token
    BCrypt::Engine.hash_secret(@secret + @path, fetch_salt)
  end
end
