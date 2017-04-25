require "card.rb"

describe Card do
  subject(:card) {Card.new(:Q, :s)}
  describe "#initialize" do
    it "initializes with a value" do
      expect(card.value).to eq(:Q)
    end

    it "initializes with a suit" do
      expect(card.suit).to eq(:s)
    end
  end
end
