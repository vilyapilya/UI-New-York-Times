require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 36 playing cards.
  def self.all_cards
    vals = Card.values
    suits = Card.suits
    cards = []

    vals.each do |v|
      suits.each do |s|
        cards << Card.new(s, v)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.size
  end

  def reveal_trump_suit
    # Returns the suit of the last card in the deck
    @cards.last.suit
  end

  def take_one
    raise "not enough cards" if self.count < 1
    @cards.pop
  end
end
