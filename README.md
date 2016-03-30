# GatorjuiceCreditRating

Finally! A tool for entering three pieces of information and getting arbitrary data back in order to make incredibly important decisions


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gatorjuice_credit_rating'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gatorjuice_credit_rating

## Usage
```ruby
inquiry = GatorjuiceCreditRating::Assessment.inquiry(age: 40, income: 25000, zipcode: 60626)

inquiry.propensity => 0.23445

inquiry.ranking => "B"
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Running Unit Tests

cd into the gem's folder and run 'bundle exec rspec'
