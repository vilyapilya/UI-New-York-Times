class Card
  include Comparable

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :two   => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.royal_values
    VALUE_STRINGS.keys[-5..-1]
  end

  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    if !SUIT_STRINGS.key?(suit.to_sym) ||
      !VALUE_STRINGS.key?(value.to_sym)
       raise "Invalid card"
    end
    @suit = suit
    @value = value
  end

  def to_s
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end

  def ==(other_card)
    (self.suit == other_card.suit) && (self.value == other_card.value)
  end

  def <=>(other_card)
    other_v = other_card.value
    other_s = other_card.suit
    if other_s == @suit && other_v == @value
      return 0
    end
    self_num_val = Card.values.find_index(@value)
    other_num_val = Card.values.find_index(other_card.value)

    self_num_suit = Card.suits.find_index(@suit)
    other_num_suit = Card.suits.find_index(other_card.suit)

    if self_num_val > other_num_val
      return 1
    elsif self_num_suit > other_num_suit && @value == other_card.value
      return 1
    elsif self_num_val < other_num_val
      return -1
    elsif self_num_suit < other_num_suit && @value == other_card.value
      return -1
    end

  end
end
