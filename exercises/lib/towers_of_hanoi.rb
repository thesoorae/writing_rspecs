require 'byebug'

class TowersOfHanoi
  attr_accessor :towers

  def initialize(towers=[[3, 2, 1], [], []])
    @towers = towers
  end

  def move(pick, place)
    pick_tower = @towers[pick]
    place_tower = @towers[place]
    raise "Invalid Move" if pick == place || pick_tower.empty?

    disk = pick_tower.last
    if valid_move?(disk, place_tower)
      place_tower << disk
      pick_tower.pop
    else
      raise "Invalid Move"
    end
  end

  def valid_move?(disk, place)
    #debugger
    bottom_disk = place.last

    place.empty? ||   disk < place.last
  end

  def won?
    @towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1]
  end
end
