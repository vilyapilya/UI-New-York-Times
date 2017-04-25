require "deck"

describe Deck do
  subject(:deck) { Deck.new }
  let(:card) { double("card") }

  describe '#initialize' do
    it "initializes with an array of cards" do
      expect(deck.deck.count).to eq(52)
      deck_test = deck.deck.all? { |card| card.is_a?(Card)}
      expect(deck_test).to eq(true)
    end

    it "should populate with correct cards" do
      deck.populate
      suits = deck.deck.select {|card| card.suit == :s}
      values = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
      suits.each {|card| values.delete(card.value)}
      expect(values).to be_empty
    end
  end

  describe '#shuffle' do
    it "shuffle the deck" do
      original_deck = deck.deck.dup
      deck.shuffle
      expect(deck.deck).not_to eq(original_deck)
    end
  end

  describe '#remove_card' do
    it "should move removed card from the deck" do
      card = deck.remove_card
      expect(deck.deck.include?(card)).to be false
    end

    it "returns the removed card" do
      expect(deck.remove_card.is_a?(Card)).to be true
    end
  end
end
