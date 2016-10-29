require 'spec_helper'

RSpec.describe RomanToArabic::Converter do
  describe "#convert" do
    context "input is invalid" do
      it "raises InvalidInput error if logical mistake is made" do
        expect { described_class.new("IVLI").convert }.to raise_error(RomanToArabic::InvalidInputError)
      end

      it "raises InvalidInput error if invalid characters are sent" do
        expect { described_class.new("YZ").convert }.to raise_error(RomanToArabic::InvalidInputError)
      end

      it "raises InvalidInput error if empty string is sent" do
        expect { described_class.new("").convert }.to raise_error(RomanToArabic::InvalidInputError)
      end
    end

    it "converts I to 1" do
      expect(described_class.new("I").convert).to eq(1)
    end

    it "converts II to 2" do
      expect(described_class.new("II").convert).to eq(2)
    end

    it "converts III to 3" do
      expect(described_class.new("III").convert).to eq(3)
    end

    it "converts IV to 4" do
      expect(described_class.new("IV").convert).to eq(4)
    end

    it "converts V to 5" do
      expect(described_class.new("V").convert).to eq(5)
    end

    it "converts VI to 6" do
      expect(described_class.new("VI").convert).to eq(6)
    end

    it "converts VII to 7" do
      expect(described_class.new("VII").convert).to eq(7)
    end

    it "converts MCMXLIV to 1944" do
      expect(described_class.new("MCMXLIV").convert).to eq(1944)
    end

    it "converts MCMLXXXIII to 1983" do
      expect(described_class.new("MCMLXXXIII").convert).to eq(1983)
    end

    it "converts MCMLXXXV to 1985" do
      expect(described_class.new("MCMLXXXV").convert).to eq(1985)
    end

    it "converts XIX to 19" do
      expect(described_class.new("XIX").convert).to eq(19)
    end
  end
end
