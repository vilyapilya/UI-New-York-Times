require 'colorize'
require_relative 'errors'

class Card

  # check the protected methods and assets!

  def self.suits
    [:spade, :diamond, :club, :heart]
  end

  def self.values
    [
      :ace,
      :two,
      :three,
      :four,
      :five,
      :six,
      :seven,
      :eight,
      :nine,
      :ten,
      :jack,
      :queen,
      :king
    ]
  end

  def self.all_cards
    vals = Card.values
    suits = Card.suits
    cards = []
    vals.each do |v|
      suits.each do |s|
        cards << Card.new(v, s)
      end
    end
    cards
  end

  attr_reader :value, :suit, :color

  def initialize(value, suit)
    @value = value
    @suit = suit
    @color = color
  end

  def to_s
    ss = SUIT_STRINGS[@suit]
    if self.num >= 2 && self.num <= 10
      return "#{self.num}#{ss}"
    else
      return "#{@value.to_s[0].upcase}#{ss}"
    end
  end

  def num
    NUM_VALUES[@value]
  end

  def stackable?(card)
    # use the Card::color method down below!
    raise UserError, "card is a king" if @value == :king
    if card.color != self.color && card.num - self.num == 1
      return true
    else
      return false
    end
  end

  def display(bg_color = :white)
    to_s.rjust(3).colorize(:background => bg_color, :color => color)
  end

  protected

  def color
    case suit
    when :spade, :club
      :black
    when :heart, :diamond
      :red
    end
  end

  NUM_VALUES = {
    :ace => 1,
    :two => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13
  }

  SUIT_STRINGS = {
    :spade => "♠",
    :heart => "♥",
    :club => "♣",
    :diamond => "♦"
  }

end
