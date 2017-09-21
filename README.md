# Swirl

Welcome to Swirl! This is how we are monetizing our smoothie business by scanning for words our affiliates are willing to give us $$$ for linking!

To experiment with swirl, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swirl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swirl

## Usage

While not super friendly, it works! To use Swirl, simply:
```
# Create a Swirl object
swirly = Swirl.new()

# Add in the html of your existing article
swirly.add_html('<p>Can I have a glass of milk?</p>')

# Add an affiliate look up database
swirly.use_affiliate_database(<look up database object>)

# Gets the profit making article's HTML.
# returns a string with links surrounding words matched in the database.
swirly.money_making_html()
# => <p>Can I have a <a href="https://susanscornermart.com/fresh/glass?partner=smooth">glass</a> of <a href="https://targot.com/must-move/milk?partner=smooth">milk</a>?</p>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/swirl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Swirl project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/swirl/blob/master/CODE_OF_CONDUCT.md).
