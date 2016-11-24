require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  let(:tower1) { game.towers[0] }
  let(:tower2) { game.towers[1] }
  let(:tower3) { game.towers[2] }

  describe "#initialize" do
    it "creates three towers" do
      expect(game.towers.length).to eq(3)
    end

    it "towers should be array" do
      expect(tower1).to be_a(Array)
    end

    it "should fill first array with three disks" do
      expect(tower1.length).to eq(3)
    end

    it "order the disks" do
      expect(tower1).to eq([3, 2, 1])
    end

    it "should have two empty arrays" do
      expect(tower2).to be_empty
      expect(tower3).to be_empty
    end
  end

  describe "#move" do
    it "moves top disk from pick tower" do
      game.move(0, 1)
      expect(tower1).to eq([3, 2])
    end

    it "places top disk onto different tower" do
      game.move(0, 1)
      expect(tower2).to eq([1])
    end

    it "requires two arguments" do
      expect { game.move(0) }.to raise_error(ArgumentError)
    end

    it "requires two different towers" do
      expect { game.move(0, 0) }.to raise_error("Invalid Move")
    end

    it "bigger disk cannot be placed on smaller disk" do
      game.move(0, 1)
      expect { game.move(0, 1) }.to raise_error("Invalid Move")
    end
  end

  describe "#won?" do
    # before(:each) do
    #   game.towers[0] = []
    #   game.towers[1] = [3, 2, 1]
    # end

    it "should return true when all disks are moved to new tower" do
      game.towers[0] = []
      game.towers[1] = [3, 2, 1]
      expect(game.won?).to be true
    end

    it "should return false if first array has disks" do
      expect(game.won?).to be false
    end
  end
end
