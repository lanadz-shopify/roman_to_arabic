module RomanToArabic
  class Converter
    def initialize(roman_number)
      @roman_number = roman_number.upcase
      @numerals = roman_number.chars.map(&:to_sym)
    end

    def valid?
      Validator.new(roman_number).valid?
    end

    def convert
      raise InvalidInputError unless valid?

      previous = 0
      numerals.inject(0) do |result, numeral|
        arabic_number = DICTIONARY[numeral.to_sym]
        # Simply add number to the result
        result += arabic_number

        # In case number is bigger than previous (i.e. IV)
        # we need to subtract this number twice:
        # 1. we previously added this number on the line above
        # 2. to do actual subtraction in order to express numbers like IV or IX
        if arabic_number > previous
          result -= 2 * previous
        end

        previous = arabic_number
        result
      end
    end

    private

    attr_reader :roman_number, :numerals
  end
end
