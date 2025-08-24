require "faraday"
require_relative "base_client"
require_relative "subreddit"
require_relative "user"

class SimplyReddit::Client < SimplyReddit::BaseClient
  BASE_URL = "https://oauth.reddit.com"
  DEFAULT_GRANT_TYPE = "client_credentials"
  USER_AGENT = "Ruby:SimplyReddit:v#{SimplyReddit::VERSION} (by unknown)"

  def initialize(client_id:, secret:, username:, password:, adapter: Faraday.default_adapter)
    @user_agent = USER_AGENT
    @client_id = client_id
    @secret = secret
    @username = username
    @password = password
    @access_token = request_access_token
    
    super(
      base_url: BASE_URL,
      adapter: adapter,
      headers: {
        "User-Agent" => @user_agent,
        "Authorization" => "Bearer #{@access_token}"
      }
    )
  end

  def subreddit(name)
    SimplyReddit::Subreddit.new(client: self, name: name)
  end

  def user(username)
    SimplyReddit::User.new(client: self, username: username)
  end

  def me
    get("/api/v1/me")
  end

  private

  def request_access_token(grant_type = DEFAULT_GRANT_TYPE, options = {})
    endpoint = "https://www.reddit.com/api/v1/access_token"

    auth_connection = Faraday.new do |conn|
      conn.headers['User-Agent'] = @user_agent
      conn.request :authorization, :basic, @client_id, @secret
      conn.response :json, content_type: "application/json"
    end
    
    response = auth_connection.post(endpoint) do |req|
      req.body = URI.encode_www_form({
        grant_type: grant_type,
        username: @username,
        password: @password
      })
    end
    
    response.body["access_token"]
  end
end

