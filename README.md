# SimplyReddit

A simple Ruby wrapper for the Reddit API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simply_reddit'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install simply_reddit
```

## Usage

### Authentication

```ruby
require 'simply_reddit'

client = SimplyReddit::Client.new(
  client_id: 'your_client_id',
  secret: 'your_client_secret',
  username: 'your_username',
  password: 'your_password'
)
```

### Getting Current User Information

```ruby
# Get information about the authenticated user
response = client.me
puts response.body # User data as JSON
puts response.status # HTTP status code
```

### Working with Subreddits

```ruby
# Access a specific subreddit
subreddit = client.subreddit('ruby')

# The subreddit object provides access to subreddit-specific functionality
# (specific methods depend on your Subreddit class implementation)
```

### Working with Users

```ruby
# Access a specific user's profile
user = client.user('spez')

# The user object provides access to user-specific functionality  
# (specific methods depend on your User class implementation)
```

### Response Format

All API responses are wrapped in a `Response` object with the following structure:

```ruby
response.status  # HTTP status code (200, 404, etc.)
response.headers # HTTP headers as a hash
response.body    # Parsed JSON response body
```

### Error Handling

```ruby
response = client.me

case response.status
when 200
  puts "Success: #{response.body}"
when 401
  puts "Authentication failed"
when 403
  puts "Forbidden - check your credentials"
else
  puts "Error: #{response.status}"
end
```