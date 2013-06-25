# iridium-ember

iridium-ember integrates [Ember](http://emberjs.com/) with
[Iridum](https://github.com/radiumsoftware/iridium). It is designed for
new and experienced developers. New developers can use it get started
quickly and experienced developers will see better performing production
apps.

## Current Features

* Precompile standalone Handlebars templates
* Precompile inline Handlebars templates
* Strip `Ember.assert`s from your code (as well as `deprecate`, `warn`, and `debug`)
* Generate an app skeleton

## Installation

`iridium-ember` expects you to have [Iridum](https://github.com/radiumsoftware/iridium) installed.

Add this line to the [`Gemfile` you created for Iridum](https://github.com/radiumsoftware/iridium/blob/master/README.md):

    gem 'iridium-ember', :github => 'radiumsoftware/iridium-ember'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install 'iridium-ember'

## Usage

Three simple steps:

1. Generate an `iridium` application:

        bundle exec iridium generate app my-app

2. `cd` into your new app's directory:

        cd my-app

3. Run the ember generator:

        bundle exec iridium generate ember:application

That's it! You're good to go.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
