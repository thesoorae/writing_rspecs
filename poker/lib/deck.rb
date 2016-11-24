class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    fill_deck
  end

  def fill_deck
    suits = [:d, :h, :s, :c]

    suits.each do |suit|
      (2..14).each do |val|
        cards << Card.new(val, suit)
      end
    end
  end

  def shuffle
    cards.shuffle!
  end

  def deal(num)
    raise "Not a valid number!" unless num.is_a?(Integer)
    cards.pop(num)
  end
end
