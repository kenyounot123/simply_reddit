class SimplyReddit::Subreddit
  def initialize(client:, name:)
    @client = client
    @name = name
  end

  def hot(limit: 25)
    @client.get("/r/#{@name}/hot", limit: limit)
  end

  def new(limit: 25)
    @client.get("/r/#{@name}/new", limit: limit)
  end

  def top(limit: 25, t: 'day')
    @client.get("/r/#{@name}/top", limit: limit, t: t)
  end

  def rising(limit: 25)
    @client.get("/r/#{@name}/rising", limit: limit)
  end

  def about
    @client.get("/r/#{@name}/about")
  end
end
