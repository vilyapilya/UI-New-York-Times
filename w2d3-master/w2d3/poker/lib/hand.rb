require_relative "card"
require_relative "matching_suits"

class Hand
  attr_reader :cards
  extend MatchingProperties

  @royal_flush = [:A, :K, :Q, :J, 10]
  @straight_flush = []

  def is_royal_flush?(hand)
    return false if !value_comb_match(@royal_flush, hand)
    return false if all_of_type(hand)
    return true
  end

end
