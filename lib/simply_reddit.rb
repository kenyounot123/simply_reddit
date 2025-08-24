# frozen_string_literal: true

require_relative "simply_reddit/version"


module SimplyReddit
  autoload :BaseClient, "simply_reddit/base_client"
  autoload :Client, "simply_reddit/client"
  autoload :Subreddit, "simply_reddit/subreddit"
  autoload :User, "simply_reddit/user"

  class Error < StandardError; end

  # Convenience method for creating a client
  def self.client(client_id:, secret:, username:, password:, **options)
    Client.new(
      client_id: client_id,
      secret: secret,
      username: username,
      password: password,
      **options
    )
  end
end
