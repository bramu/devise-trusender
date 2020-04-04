# DevisePlugTrusender

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/devise_plug_trusender`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise_plug_trusender'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_plug_trusender

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/devise_plug_trusender. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DevisePlugTrusender project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/devise_plug_trusender/blob/master/CODE_OF_CONDUCT.md).


TODO::ADD BELOW EMAIL TEMPLATES IN TRUSENDER

TemplateName: confirmation_instructions
Subject: "Confirmation instructions"

BODY:

<p>Welcome <%= @email %>!</p>

<p>You can confirm your account email through the link below:</p>

<p><%= link_to 'Confirm my account', confirmation_url(@resource, confirmation_token: @token) %></p>



TemplateName: reset_password_instructions
Subject: "Reset password instructions"

BODY:

<p>Hello <%= @resource.email %>!</p>

<p>Someone has requested a link to change your password. You can do this through the link below.</p>

<p><%= link_to 'Change my password', edit_password_url(@resource, reset_password_token: @token) %></p>

<p>If you didn't request this, please ignore this email.</p>
<p>Your password won't change until you access the link above and create a new one.</p>



TemplateName: unlock_instructions
Subject: "Unlock instructions"

BODY:

<p>Hello <%= @resource.email %>!</p>

<p>Your account has been locked due to an excessive number of unsuccessful sign in attempts.</p>

<p>Click the link below to unlock your account:</p>

<p><%= link_to 'Unlock my account', unlock_url(@resource, unlock_token: @token) %></p>


TemplateName: email_changed
Subject: "Email Changed"
BODY:

<p>Hello <%= @email %>!</p>

<% if @resource.try(:unconfirmed_email?) %>
  <p>We're contacting you to notify you that your email is being changed to <%= @resource.unconfirmed_email %>.</p>
<% else %>
  <p>We're contacting you to notify you that your email has been changed to <%= @resource.email %>.</p>
<% end %>


TemplateName: password_change
Subject: "Password Changed"

BODY:

<p>Hello <%= @resource.email %>!</p>

<p>We're contacting you to notify you that your password has been changed.</p>