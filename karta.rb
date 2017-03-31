require "byebug"
class Karta

  def initialize
    @karta = Array.new(0)
  end

  def show
    @karta.each {|ar| print "{#{ar[0]} => #{ar[1]}}"}
  end

  def remove(key)
    @karta.each {|ar| @karta.delete(ar) if ar[0] == key}
  end

  def look_up(key)
    @karta.each {|ar| return ar[1] if ar[0] == key}
    nil
  end

  def assign(key, value)
    return @karta << [key, value] if @karta.size == 0
    i = 0
    while i < @karta.size
      if @karta[i].size == 0
        @karta[i] = [key, value]
        return @karta[i]
      end
      if @karta[i][0] == key
        @karta[i] = value
        return @karta[i]
      end
      i+=1
    end
    @karta << [key, value]
  end

end
