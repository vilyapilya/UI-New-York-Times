require_relative './card'
require_relative './hand'

class Deck
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

  def deal_hand
    hand = self.take(5)
    Hand.new(hand)
  end

  def count
    @cards.count
  end

  def take(n)
    raise "not enough cards" if n > self.count
    taken = []
    n.times {taken << @cards.shift}
    taken
  end

  def return(cards)
    @cards += cards

  end

  def shuffle
    @cards.shuffle!
  end
end
