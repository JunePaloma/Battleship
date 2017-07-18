require './lib/three_unit_ship'
require './lib/two_unit_ship'
require './lib/ships'
require './lib/game_board'
require 'pry'
class ComputerPlayer
  attr_accessor :compboard


  def initialize
    @compboard = GameBoard.new
  end

def pick_index_for_first_coordinate
  prng = Random.new
  prng.rand(15)
end

def get_coordinate_for_first_space
  first_index = pick_index_for_first_coordinate
  board_array = @compboard.make_array_of_empty_spaces
  first_coordinate = board_array[first_index]
end


end
