class Player
  attr_reader :name
  attr_accessor :cards, :trump_suit

  def initialize(name)
    @trump_suit = nil
    @name = name
    @cards = []
  end

  def fill_hand(deck)
    6.times { @cards << deck.take_one if deck.count > 0 }
  end

  def take(new_cards)
    @cards += new_cards
  end

  # To simplify game logic, assume that the attacker will always
  # choose to attack with their lowest value card not of the trump suit.
  # If the player only has cards matching the trump suit, then choose
  # from these the card with the lowest value.
  # In real-life gameplay, this is usually the best attaking strategy,
  # as you want to save your high-value cards for defense.
  def attack
    min = 14
    min_c = nil
    self.non_trump_cards.each do |c|
      if c.int_val < min
        min_c = c
        min = c.int_val
      end
    end
    if min_c.nil?
      self.trump_cards.each do |c|
        if c.int_val < min
          min_c = c
          min = c.int_val
        end
      end
    end
    @cards.delete(min_c)
    min_c
  end

  # See README (Each turn #2) for instructions on how to choose defending card.
  # Return nil if no winning move is possible.
  def defend(attacking_card)
    min = 15
    min_c = nil
    if attacking_card.suit == @trump_suit
      self.trump_cards.each do |c|
        if c.int_val > attacking_card.int_val &&
          c.int_val < min
          min_c = c
          min = c.int_val
        end
      end
    else
      self.non_trump_cards.each do |c|
        if c.int_val > attacking_card.int_val &&
          c.int_val < min && attacking_card.suit == c.suit
          min_c = c
          min = c.int_val
        end
      end
    end
    @cards.delete(min_c)
    min_c
  end

  # Helper method which returns the lowest card in an array card_subset
  # which is higher than the min value (if given)
  def lowest_card(card_subset, min = nil)

  
  end

  # Helper method which returns a subset of the player's cards
  # that match the trump suit. Hint: use Array#select
  def trump_cards
    @cards.select {|c| c.suit == @trump_suit}
  end

  # Helper method which returns a subset of the player's cards
  # that don't match the trump suit. Hint: use Array#reject
  def non_trump_cards
    @cards.select {|c| c.suit != @trump_suit}
  end

  # Called during Game#take_turn to print player's cards
  # to the command line. No need to modify this method.
  def print_cards
    str_arr = @cards.map { |card| card.to_s }
    cards_str = str_arr.join(", ")
    "#{@name}'s cards: #{cards_str}"
  end
end
