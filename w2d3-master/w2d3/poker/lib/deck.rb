require_relative "card"

class Deck
  attr_reader :deck

  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
  SUITS = [:s, :d, :h, :c]

  def initialize
    @deck = Array.new
    self.populate
  end

  def populate
    VALUES.each do |value|
      SUITS.each do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end

  def remove_card
    @deck.pop
  end

  def shuffle
    @deck.shuffle!
  end
end
