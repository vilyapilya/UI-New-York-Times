require "rspec"
require "hanoi"

describe Hanoi do
  subject (:hanoi) {Hanoi.new}
  describe "#initialize" do
    it "piles should be an array of arrays" do
      expect(hanoi.piles.is_a?(Array)).to eq(true)
    end

    it "should initialize with three arrays" do
      expect(hanoi.piles.count).to eq(3)
    end

    it "second and third elements in the array should be zero" do
      expect(hanoi.piles[1].count).to eq(0)
      expect(hanoi.piles[2].count).to eq(0)
    end

    it "the first element of the array is in descending order" do
      expect(hanoi.piles[0]).to eq([3, 2, 1])
    end
  end


  describe "#move" do

    it "should move a top disc to an empty pile" do
      hanoi.move(0, 1)
      expect(hanoi.piles).to eq([[3, 2], [1], []])
    end

    it "raises an error when trying to remove a disc from an empty pile" do
      expect {hanoi.move(2,1)}.to raise_error("The pile is empty!")
    end

    it "should not move a larger disc on a smaller one" do
      hanoi.move(0,1)
      expect {hanoi.move(0, 1)}.to raise_error("Invalid move!")
    end

    it "raises an error when the selected pile is out of bounds" do
      expect {hanoi.move(-1, 2)}.to raise_error("The pile is out bounds")
      expect {hanoi.move(0, 4)}.to raise_error("The pile is out bounds")
    end
  end

  describe "#won?" do
    it "should return true if either pile at 1 or 2 is full" do
      hanoi.piles = [ [], [3, 2, 1], [] ]
      expect(hanoi.won?).to eq(true)
      hanoi.piles = [ [], [], [3, 2, 1]]
      expect(hanoi.won?).to eq(true)
    end

    it "should return false when the first pile is full" do
      expect(hanoi.won?).to eq(false)
    end

    it "should return false when the 1st pile is empty but the 2nd and 3nd" do
      hanoi.piles = [ [], [1], [2, 3] ]
      expect(hanoi.won?).to eq(false)
    end
  end
end
