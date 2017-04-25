
def remove_dups(arr)
  result = []
  (arr).each do |el|
    result << el unless result.include?(el)
  end
  result
end

class Array
  def two_sum
    result = []
    (0...self.count - 1).each do |i|
      ((i + 1)...self.count).each do |j|
        result << [i, j] if self[i] + self[j] == 0
      end
    end
    result
  end
end

def my_transpose(matrix)
  return nil if matrix.empty?
  matrix.each do |subarray|
    raise "It should be a matrix" unless subarray.is_a?(Array)
    raise "It should be a square" unless subarray.count == matrix.count
  end

  result = Array.new(matrix.count) { Array.new(matrix.count) }
  (0...matrix.count).each do |i|
    (0...matrix.count).each do |j|
      result[j][i] = matrix[i][j]
    end
  end
  result
end

def stock_picker(arr)
  max_difference = 0
  max_indices = []
  (0...arr.count - 1).each do |i|
    ((i + 1)...arr.count).each do |j|
      current_difference = arr[j] - arr[i]
      if current_difference > max_difference
        max_difference = current_difference
        max_indices = [i, j]
      end
    end
  end
  return nil if max_difference <= 0
  "Buy on day #{max_indices[0] + 1} and sell on day #{max_indices[1] + 1}"
end
