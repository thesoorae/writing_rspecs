require 'byebug'
class Array

  def my_uniq
    new_arr = []
    self.each { |el| new_arr << el unless new_arr.include?(el) }
    new_arr
  end


  def two_sum
    new_arr = []
    size = self.length
    (0...(size-1)).each do | idx1 |
      ((idx1+1)...size).each do |idx2|
        new_arr << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    new_arr
  end

  def my_transpose
    size = self.length
    return self if size <= 1
    new_arr = Array.new(size) { [] }

    (0...size).each do |idx|
      self.each do |row|
        new_arr[idx] << row[idx]
      end
    end
    new_arr
  end

  def stock_picker
    size = self.length
    raise "Array length should be greater than 1" if size < 2 
    best_return = self[1] - self[0]
    best_days = [0,1]
    (0...(size-1)).each do | idx1 |
      ((idx1+1)...size).each do |idx2|
        if self[idx2] - self[idx1] > best_return
          best_days = [idx1, idx2]
          best_return = self[idx2] - self[idx1]
        end
      end
    end
    best_days
  end
end
