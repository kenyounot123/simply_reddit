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

```ruby
require 'simply_reddit'

client = SimplyReddit.client(
  client_id: 'your_client_id',
  secret: 'your_client_secret',
  username: 'your_username',
  password: 'your_password'
)
```
```