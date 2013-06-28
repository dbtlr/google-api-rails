# Google API Wrapper for Ruby on Rails

This wraps the official [Google Ruby API client](https://github.com/google/google-api-ruby-client). All documentation for interacting with the actual client can be found there.

## Installation

Add the gem to your Gemfile:

```ruby
gem install google-api-rails
```

Create an initializer, for instance google-api-rails.rb with the following:

```ruby
GoogleApi.config do |config|
  config.client_id = "<Your Google API Client Id"
  config.client_secret = "<Your Application Secret>"
  config.application_name = "<Your Application Name>"
end
```

## Getting Started

To use the Ruby API client, simple access it through the wrapper like so:

```ruby
# Make an API call
result = client.execute(
  :api_method => plus.activities.list,
  :parameters => {'collection' => 'public', 'userId' => 'me'}
)
```

## About This Gem

I wrote this simply to have the convenience of keeping my Google API config in an initializer, instead of all over my apps. If you know of a better way or see something I missed, feel free to submit an issue or pull request.