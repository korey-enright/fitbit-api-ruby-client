# Fitbit

fitbit-api-client provides access to Fitbit API. fitbit-api-client supports OAuth 2.0.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fitbit-api-client', require: 'fitbit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fitbit-api-client

## Usage

```ruby
client = Fitbit::Client.new(
  client_id: Settings.fitbit.client_id,
  client_secret: Settings.fitbit.client_secret,
  access_token: current_user.access_token,
  refresh_token: current_user.refresh_token,
  expires_at: current_user.expires_at)

p client.activity
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kaorumori/fitbit-api-ruby-client.
