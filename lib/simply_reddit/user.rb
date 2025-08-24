class SimplyReddit::User
  def initialize(client:, username:)
    @client = client
    @username = username
  end

  def about
    @client.get("/user/#{@username}/about")
  end

  def posts(limit: 25, sort: 'new')
    @client.get("/user/#{@username}/submitted", limit: limit, sort: sort)
  end

  def comments(limit: 25, sort: 'new')
    @client.get("/user/#{@username}/comments", limit: limit, sort: sort)
  end
end
