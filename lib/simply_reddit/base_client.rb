require "faraday"

class SimplyReddit::BaseClient
  # Response struct to wrap API responses
  Response = Struct.new(:status, :headers, :body)

  def initialize(base_url:, adapter: Faraday.default_adapter, headers: {})
    @base_url = base_url
    @adapter = adapter
    @default_headers = headers
    @connection = nil
  end

  # HTTP methods
  def get(path, params = {})
    response = connection.get(path, params)
    wrap_response(response)
  end

  def post(path, body = {})
    response = connection.post(path, body)
    wrap_response(response)
  end

  def put(path, body = {})
    response = connection.put(path, body)
    wrap_response(response)
  end

  def delete(path, params = {})
    response = connection.delete(path, params)
    wrap_response(response)
  end

  protected

  def configure_connection(conn)
    conn.request :json
    conn.response :json, content_type: "application/json"
  end

  def connection_headers
    @default_headers
  end

  private

  def wrap_response(faraday_response)
    Response.new(
      body: faraday_response.body,
      status: faraday_response.status,
      headers: faraday_response.headers
    )
  end

  def connection
    @connection ||= Faraday.new do |conn|
      conn.url_prefix = @base_url
      conn.adapter @adapter

      connection_headers.each do |key, value|
        conn.headers[key] = value
      end

      configure_connection(conn)
    end
  end
end
