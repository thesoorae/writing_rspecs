require 'card'
require 'deck'

describe Card do
  subject(:card) { Card.new(val, suit) }
  let(:val) { 9 }
  let(:suit) { :d }

  describe "#initialize" do
    it "should have a suit" do
      expect(card.val).to eq(9)
    end

    it "should have a value" do
      expect(card.suit).to eq(:d)
    end
  end
end

describe Deck do
  subject(:deck) { Deck.new }
  let(:cards) { deck.cards }

  describe "#initialize" do
    it "contains 52 elements" do
      expect(cards.length).to eq(52)
    end

    it "is made up of cards" do
      expect(cards).to all( be_a(Card) )
    end

    it "has 13 cards of each suit" do
      diamonds = cards.select { |card| card.suit == :d }
      expect(diamonds.length).to eq(13)
    end

    it "holds card objects in an array" do
      expect(cards).to be_a(Array)
    end

    it "contains no duplicates" do
      expect(cards).to eq(cards.uniq)
    end
  end

  let(:deck2) { Deck.new }

  describe "#shuffle" do
    it "should shuffle the cards randomly" do
      deck.shuffle
      expect(deck.cards).to_not eq(deck2.cards)
    end
  end

  describe "#deal" do
    it "accepts num as an argument" do
      expect { deck.deal("2") }.to raise_error("Not a valid number!")
    end

    it "returns an array of cards" do
        expect(deck.deal(1)).to be_a(Array)
    end

    it "returns the number of cards requested" do
      expect(deck.deal(2).length).to eq(2)
    end

    it "decreases cards available by number of cards dealt" do
      deck.deal(10)
      expect(cards.length).to eq(42)
    end
  end
end


# describe Game do
#   let(:player1) { double("sr", hand: []) }
#   let(:player2) { double("isai", hand: []) }
#   # before(:each) { deck.deal(player1, player2) }
#
#   context "when round begins" do
#     it "deals five cards to each player" do
#       allow(player1).to receive(:hand=)#.with(dealt_cards) { player1.hand += dealt_cards }
#       allow(player2).to receive(:hand=)#.with(dealt_cards) { player2.hand += dealt_cards }
#       deck.deal(player1, player2)
#       expect(player1.hand.length).to eq(5)
#       expect(player2.hand.length).to eq(5)
#     end
#     context "when player already has cards" do
#      let(:player3) { double("joe", hand: [Card.new(3, :h), Card.new(10, :c)]) }
#      before(:each) { deck.deal(player3) }
#
#      it "deals cards to players who have less than 5 cards" do
#        expect(player3.hand.length).to eq(5)
#      end
#
#      it "decreases cards available by number of cards dealt" do
#        expect(cards.length).to eq(49)
# end
