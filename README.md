# OmniAuth::Strategies::Webex

OAuth2 Strategy for [Cisco WebEx Teams (Cisco Spark)](https://www.webex.com/products/teams/index.html)

## Installation

Add this line to your application's Gemfile along with OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-webex-oauth2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-webex-oauth2

## Usage

You can register your application [here](https://developer.webex.com/authentication.html) and get `client_id` & `client_secret`.

Here's an example for adding the middleware to a Rails app in config/initializers/omniauth.rb:
```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :webex, ENV["WEBEX_CLIENT_ID"], ENV["WEBEX_CLIENT_SECRET"]
end
```

## Contributing

Bug reports and pull requests are welcome.

1. Fork it
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes along with test cases (`git commit -m 'Add feature'`)
4. If possible squash your commits to one commit if they all belong to same feature.
5. Push to the branch (`git push origin new-feature`)
6. Create new Pull Request.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
