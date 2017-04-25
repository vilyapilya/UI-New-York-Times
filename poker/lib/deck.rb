require 'card'
class Deck

  def self.all_cards
    cards = []
    suits = Card.suits
    values = Card.values

    values.each do |v|
      suits.each do |s|
        cards << Card.new(s, v)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def take(n)
    
  end

end
