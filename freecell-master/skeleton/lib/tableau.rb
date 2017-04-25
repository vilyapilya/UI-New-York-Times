require_relative 'card'

class Tableau

  def initialize(cards = [])
    @cards = cards
  end

  def add_cards(cards)
    @cards << cards.shift if self.empty?
    cards.each do |c|
      if !c.stackable?(@cards.last)
        raise UserError, "card(s) cannot be stacked on this tableau"
      end
      @cards << c
    end
  end

  def empty?
    @cards.empty?
  end

  def last
    @cards.last
  end

  def [](index)
    @cards[index]
  end

  def grabbable?(index)
    i = index
    while i < self.count - 1
      current = @cards[i]
      next_C = @cards[i+1]
      if current.num - next_C.num == 1 &&
        current.color != next_C.color
        p current.color
        return true
      else
        return false
      end
      i+=1
    end
  end

  def grab(index)
    @grabbed = []
    if self.grabbable?(index)
      @grabbed = @cards.slice!(index..-1)
    end
    @grabbed
  end

  def count
    @cards.size
  end

  private

end
