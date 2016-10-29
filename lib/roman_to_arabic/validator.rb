module RomanToArabic
  class Validator
    def initialize(roman_number)
      @roman_number = roman_number.upcase
      @numerals = roman_number.chars.map(&:to_sym)
    end

    def valid?
      valid_characters? &&
        characters_are_not_repeated? &&
        valid_characters_order? &&
        valid_subtractions?
    end

    private

    attr_reader :roman_number, :numerals

    def valid_characters?
      roman_number =~ /^[IVXLCDM]+$/
    end

    # The symbols "I", "X", "C", and "M" can be repeated
    # three times in succession, but no more.
    # "D", "L", and "V" can never be repeated.
    def characters_are_not_repeated?
      (roman_number =~ /D{2,}|L{2,}|V{2,}|I{4,}|X{4,}|C{4,}|M{4,}/).nil?
    end

    # "I" can be subtracted from "V" and "X" only.
    # /IL|IC|ID|IM/
    # "X" can be subtracted from "L" and "C" only.
    # /XD|XM/
    # "C" can be subtracted from "D" and "M" only.
    # "V", "L", and "D" can never be subtracted.
    # /VX|VL|VC|VD|VM|LC|LD|LM|DM/
    def valid_characters_order?
      (roman_number =~ /IL|IC|ID|IM|XD|XM|VX|VL|VC|VD|VM|LC|LD|LM|DM/).nil?
    end

    # Only one small-value symbol may be subtracted from any large-value symbol.
    # i.e. IIV considered invalid
    # III, XXX, etc.. cases are covered by `#characters_are_not_repeated?`
    def valid_subtractions?
      return true if roman_number.length < 3 # we are not interested if length is 2 or less

      for i in (1...(numerals.length - 1))
        current_number = DICTIONARY[numerals[i]]
        previous_number = DICTIONARY[numerals[i-1]]
        next_number = DICTIONARY[numerals[i+1]]

        if previous_number <= current_number && current_number < next_number
          return false
        end
      end

      true
    end
  end
end
