require "byebug"
class Hanoi
  attr_accessor :piles

  def initialize
    @piles = [ [3, 2, 1], [], [] ]
  end

  def prompt
    puts "Please choose a pile to take a disc from"
    from = gets.chomp.to_i
    puts "Please choose a pile to put the disc on"
    to = gets.chomp.to_i
    move(from, to)
  end

  def move(from, to)
    raise "The pile is out bounds" if from < 0 || from > 2 || to < 0 ||to > 2
    raise "The pile is empty!" if @piles[from].empty?
    raise "Invalid move!" if !@piles[to].empty? &&
       @piles[from].last > @piles[to].last
    disc = @piles[from].pop
    @piles[to] << disc
  end

  def won?
    if @piles[0].empty? && @piles[2].empty? && @piles[1].size == 3
      return true
    elsif @piles[0].empty? && @piles[1].empty? && @piles[2].size == 3
      return true
    else
      false
    end
  end
end
