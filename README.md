# DevisePlugTrusender

devise_trusender is mail sending ruby gem for devise! You can better manage and send the emails for the devise gem from trusender. More information please visit https://www.trusender.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise_trusender'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_trusender

## Usage

Register your self as an user and copy the keys for both sandbox and live environment below
in config/environments/development.rb
```ruby
config.after_initialize do
    DeviseTruSender::token("YOUR SANDBOX TOKEN")
end
```

in config/environments/production.rb
```ruby
config.after_initialize do
    DeviseTruSender::token("YOUR LIVE TOKEN")
end
```

TODO::ADD BELOW EMAIL TEMPLATES IN TRUSENDER

TemplateName: confirmation_instructions
Subject: "Confirmation instructions"

BODY:

<p>Welcome <%= @email %>!</p>

<p>You can confirm your account email through the link below:</p>

<p><a href="{{confirmation_url}}">Confirm my account</a></p>


TemplateName: reset_password_instructions
Subject: "Reset password instructions"

BODY:

<p>Hello {{email}}!</p>

<p>Someone has requested a link to change your password. You can do this through the link below.</p>

<p><a href="{{edit_password_url}}">Change my password</a></p>

<p>If you didn't request this, please ignore this email.</p>
<p>Your password won't change until you access the link above and create a new one.</p>


TemplateName: unlock_instructions
Subject: "Unlock instructions"

BODY:

<p>Hello {{email}}!</p>

<p>Your account has been locked due to an excessive number of unsuccessful sign in attempts.</p>

<p>Click the link below to unlock your account:</p>

<p><a href="{{unlock_url}}">Unlock my account</a></p>

TemplateName: email_changed
Subject: "Email Changed"
BODY:

<p>Hello {{email}}!</p>

{{#if unconfirmed_email}}
    <p>We're contacting you to notify you that your email is being changed to {{unconfirmed_email}}</p>
{{else}}
    <p>We're contacting you to notify you that your email has been changed to {{email}}.</p>
{{/if}}

TemplateName: password_change
Subject: "Password Changed"

BODY:
<p>Hello {{email}}!</p>

<p>We're contacting you to notify you that your password has been changed.</p>


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
