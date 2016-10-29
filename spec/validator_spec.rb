require 'spec_helper'

RSpec.describe RomanToArabic::Validator do
  describe "#valid?" do
    it "X is valid" do
      expect(described_class.new("X").valid?).to be true
    end

    it "CC is valid" do
      expect(described_class.new("CC").valid?).to be true
    end

    it "III is valid" do
      expect(described_class.new("III").valid?).to be true
    end

    it "MMMM is invalid" do
      expect(described_class.new("MMMM").valid?).to be false
    end

    it "D is valid" do
      expect(described_class.new("D").valid?).to be true
    end

    it "LL is invalid" do
      expect(described_class.new("LL").valid?).to be false
    end

    it "IV, IX are valid" do
      expect(described_class.new("IV").valid?).to be true
      expect(described_class.new("IX").valid?).to be true
    end

    it "IL, IC, ID, IM are invalid" do
      expect(described_class.new("IL").valid?).to be false
      expect(described_class.new("IC").valid?).to be false
      expect(described_class.new("ID").valid?).to be false
      expect(described_class.new("IM").valid?).to be false
    end

    it "IVX, IIX, XCM are invalid" do
      expect(described_class.new("IVX").valid?).to be false
      expect(described_class.new("IIX").valid?).to be false
      expect(described_class.new("XCM").valid?).to be false
      expect(described_class.new("IIIV").valid?).to be false
    end
  end
end
