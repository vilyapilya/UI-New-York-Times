module MatchingProperties

  def all_of_type?(hand)
    i = 0
    while i < hand.size - 1
      j = i + 1
      while j < hand.size
        first_val = hand[i].suit
        second_val = hand[j].suit
        return false if first_val != second_val
        j+=1
      end
      i+=1
    end
    return true
  end

  def value_comb_match?(player_h, hand)
    player_h.each {|card| return false if !hand.inclue?(card)}
    return true
  end
end
