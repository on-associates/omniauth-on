# Omniauth::On - Vantage Omniauth - Strategy

## Usage
Get your OAUTH_APPLICATION_ID AND OAUTH_APPLICATION_SECRET in Vantage site /oauth/applications/:id

### With Devise

Add these codes in `config/initializers/devise.rb`

```
config.omniauth :on, #{OAUTH_APPLICATION_ID}, #{OAUTH_APPLICATION_SECRET}
```

### Without Devise

Create file in `config/initializers` named `omniauth.rb` write this

```
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :on, #{OAUTH_APPLICATION_ID}, #{OAUTH_APPLICATION_SECRET}
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::On project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/omniauth-on/blob/master/CODE_OF_CONDUCT.md).
