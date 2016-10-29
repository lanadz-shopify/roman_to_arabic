require "roman_to_arabic/version"
require "roman_to_arabic/invalid_input_error"
require "roman_to_arabic/validator"
require "roman_to_arabic/converter"

module RomanToArabic
  DICTIONARY = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1_000 }.freeze
end
