class Hand
  attr_accessor :hand

  def initialize(array)
    @hand = array
  end

  def find_high
    hand.max_by(&:val)
  end

  def find_pairs
    pairs = []
    hand.sort_by!(&:val)
    idx = 0
    while idx < 4
      first = hand[idx]
      second = hand[idx + 1]
      if first.val == second.val
        pairs += [first, second]
        idx += 2
      else
        idx +=1
      end
    end
    pairs
  end
end
