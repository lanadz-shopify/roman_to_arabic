# RomanToArabic

Simple library for parsing/validating/converting Roman numerals to Arabic numbers

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roman_to_arabic'
```

And then execute:

    $ bundle

Or install it yourself:

    $ gem install roman_to_arabic

## Usage

### Validation

Validation is automatically handled when you try to convert Roman numerals, but you can also explicitly run validation:
```ruby
valid_roman_numerals = "IV"
validator = RomanToArabic::Validator.new(valid_roman_numerals)
puts validator.valid? # true

invalid_roman_numerals = "IVLI"
validator = RomanToArabic::Validator.new(invalid_roman_numerals)
puts validator.valid? # false
```

### Conversion

Create an instance of the Converter class and pass a Roman numerals string as an argument to the constructor:
```ruby
roman_numerals = "IV"
converter = RomanToArabic::Converter.new(roman_numerals)
arabic_number = converter.convert
puts arabic_number # "4"
```

Conversion automatically runs validation on the input, so passing any invalid Roman numerals will raise an exception `RomanToArabic::InvalidInputError`: 
```ruby
begin
    invalid_roman_numerals = "IVLI"
    converter = RomanToArabic::Converter.new(invalid_roman_numerals)
    arabic_number = converter.convert
rescue RomanToArabic::InvalidInputError
    puts "Error: input is invalid"
end
```

## Development

This gem doesn't have any dependencies rather than Rspec for the tests.
After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

