# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roman_to_arabic/version'

Gem::Specification.new do |spec|
  spec.name          = "roman_to_arabic"
  spec.version       = RomanToArabic::VERSION
  spec.authors       = ["Svitlana Dzyuban"]
  spec.email         = ["svitlana.dzyuban@gmail.com"]

  spec.summary       = %q{Converts Roman number to integer}
  spec.description   = %q{Tool that provides reliable conversion of the numbers
                          from Roman system to Arabic.}
  spec.homepage      = "https://github.com/lanadz/roman_to_arabic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
