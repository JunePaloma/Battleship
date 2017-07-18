require './lib/game_board'
class Ships
attr_reader :coordinate1,
            :coordinate2,
            :coordinate3
  def initialize(coordinate1, coordinate2, coordinate3 = nil)
    @c1 = coordinate1
    @c2 = coordinate2
    @c3 = coordinate3
    @hits = 0
  #  @destroyed = false
  end

  def what_size
    if @c3 != nil
      three_unit_ship
    else
      two_unit_ship
    end
  end

  def two_unit_ship

  end


  def little_ship_vertical_valid?
  #  ship = make_array_of_occupied_spaces
    board = gameboard.make_array_of_all_spaces
    if board.index(coordinate2) - board.index(coordinate1) == 4
      return true
    else
      return false
    end
  end

  def three_unit_ship
    "three_unit"
  end

end
