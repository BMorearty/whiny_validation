# WhinyValidation

When an ActiveRecord model won't save because it's invalid,
this gem writes the validation error messages to the log.

It can be useful in development and especially in test mode,
to understand why a model didn't save.

## Installation

Add this line to your application's Gemfile:

    gem 'whiny_validation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whiny_validation

## Usage

When a model didn't save but you expected it to save, look in the
log for "Validation failed."

## Configuration

There ain't no configuration so stop your whining.
The gem uses debug-level logging, so any Rails environment
with debug-level logging will include the whiny validation messages.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
