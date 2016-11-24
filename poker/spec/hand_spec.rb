require 'hand'

describe Hand do

  subject(:hand1) { Hand.new([a, b, c, d, e]) }
  let(:a) { double("a", val: 2, suit: :d) }
  let(:b) { double("b", val: 3, suit: :d) }
  let(:c) { double("c", val: 4, suit: :d) }
  let(:d) { double("d", val: 6, suit: :c) }
  let(:e) { double("e", val: 6, suit: :d) }
  let(:f) { double("f", val: 3, suit: :h) }
  let(:g) { double("g", val: 3, suit: :c) }

  let(:hand) { hand1.hand }

  describe "#initialize" do
    it "should be an array" do
      expect(hand).to be_a(Array)
    end
  end

  describe "#find_high" do
    it "should return highest card in hand" do
      expect(hand1.find_high).to eq(d || e)
    end
  end

  describe "#find_pairs" do
    context "when there is only one pair"
      it "should return two cards if only one pair" do
        expect(hand1.find_pairs).to eq([d, e])
      end

      it "cards should have same value" do
        pair = hand1.find_pairs
        expect(pair.first.val).to eq(pair.last.val)
      end
    end

  context "when there are two pairs" do
    let(:hand2) { Hand.new( [b, d , a, e, f]) }

    it "should return four cards if two pairs" do
      pair2 = hand2.find_pairs
      expect(pair2.flatten.length).to eq(4)
    end
  end

  let(:hand3) { Hand.new( [a, b, c, f, g])}
  describe "#find_three" do
    it "should return three of a kind cards" do
      expect(hand3.find_three).to include(b, f, g)
    end
  end

  describe "#find_straight" do
    it "should return five cards"

    it "all cards are sequential"
  end

  describe "#find_flush" do
    it "should return five cards"

    it "all cards are same suit"
  end

  describe "#find_full_house" do
    it "should call #find_three"

    it "should call #find_pair"

    it "should return five cards"
  end

  describe "#find_four" do

    it "should return four of a kind"

  end

  describe "#find_straight_flush" do

    it "should call #find_flush"

    it "should call #find_straight"

    it "should find straight flush"

  end

  describe "#best_hand" do
    it "should return a flush over a pair"

    it "should return a full house over three of a kind"

    it "should return highest single card if no other"
  end
end
