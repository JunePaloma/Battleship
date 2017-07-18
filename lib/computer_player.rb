require './lib/three_unit_ship'
require './lib/two_unit_ship'
require './lib/ships'
require './lib/game_board'
require 'pry'
class ComputerPlayer
  attr_accessor :compboard


  def initialize
    @compboard = GameBoard.new
    @first_coordinate_choice = 0
  end

  def pick_index_for_first_coordinate
    prng = Random.new
    @first_coordinate_choice = prng.rand(15)
  end

  def get_coordinate_for_first_space
    first_index = pick_index_for_first_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    first_coordinate = board_array[@first_coordinate_choice]
  end

  def use_first_coordinate_to_find_second_coordinate
    first_coordinate = get_coordinate_for_first_space
    board_array = @compboard.make_array_of_empty_spaces
    second_coordinate = ""
    if first_coordinate[1] == "4" || first_coordinate[1] == "2"
      second_coordinate = board_array[@first_coordinate_choice-1]
    elsif first_coordinate[1] == "1" || first_coordinate[1] == "3"
      second_coordinate = board_array[@first_coordinate_choice+1]
    return second_coordinate
    end
  end


end
