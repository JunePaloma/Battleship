require './lib/game_board'
class Ships
attr_reader :coordinate1,
            :coordinate2,
            :coordinate3
  def initialize(coordinate1, coordinate2, coordinate3 = nil)
    @c1 = coordinate1
    @c2 = coordinate2
    @c3 = coordinate3
    @hit = 0
    @destroyed = false
  end

  def how_big(c3)
    if c3 = nil
      two_unit_ship
    else
      three_unit_ship
    end
  end


end
