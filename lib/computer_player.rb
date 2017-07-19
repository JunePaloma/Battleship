require './lib/three_unit_ship'
require './lib/two_unit_ship'
require './lib/ships'
require './lib/game_board'
require 'pry'
class ComputerPlayer
  attr_accessor :compboard,
                :little_ship_coordinate_1,
                :little_ship_coordinate_2



  def initialize
    @compboard = GameBoard.new
    @starting_index = 0
    @first_coordinate_ls = ""
    @second_coordinate_ls = ""

  end

  def create_little_ship_coordinates
    first_coordinate = generate_first_little_ship_coordinate
    second_coordinate = generate_second_little_ship_coordinate
    #if first_coordinate[1].to_i > second_coordinate[0].to_i
    "#{generate_first_little_ship_coordinate}, #{generate_second_little_ship_coordinate}"
  end

  def generate_first_little_ship_coordinate
    @first_coordinate_ls = generate_first_coordinate
  end

  def generate_second_little_ship_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    if @first_coordinate_ls[1] == "1" || @first_coordinate_ls[1] == "3"|| @first_coordinate_ls[1] == "2"
      @second_coordinate_ls = board_array[@starting_index+1]
    elsif @first_coordinate_ls[1] == "4"
        @second_coordinate_ls = board_array[@starting_index+4]
    end
  end

  def generate_first_big_ship_coordinate
    @first_coordinate_bs = generate_first_coordinate
  end

  def generate_first_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    board_array[pick_index_for_first_coordinate] #this returns a coordinate key
  end

  def pick_index_for_first_coordinate
    prng = Random.new
    @starting_index = prng.rand(15)
  end




end
