require './lib/three_unit_ship'
require './lib/two_unit_ship'
require './lib/ships'
require './lib/game_board'
require './lib/opponent_map'
require 'pry'
class ComputerPlayer
  attr_accessor :compboard,
                :first_coordinate_ls,
                :second_coordinate_ls,
                :first_coodinate_bs,
                :second_coordinate_bs,
                :third_coordinate_bs,
                :shot,
                :little_ship,
                :ls_starting_index

  def initialize
    @compboard = GameBoard.new
    @opp_map = OpponentMap.new
    @ls_starting_index = 0
    @bs_starting_index = 0
    @first_coordinate_ls = ""
    @second_coordinate_ls = ""
    @first_coodinate_bs = ""
    @second_coordinate_bs = ""
    @third_coordinate_bs = ""
    @little_ship = nil
    @big_ship = nil
  end


    def generate_first_little_ship_coordinate
      board_array = @compboard.make_array_of_empty_spaces
      @first_coordinate_ls = board_array[pick_index_for_first_little_ship_coordinate] #this returns a coordinate key
    end

    def pick_index_for_first_little_ship_coordinate
      prng = Random.new
      @ls_starting_index = prng.rand(14)
    end


  def place_little_ship
    create_little_ship_coordinates
  @little_ship = @compboard.make_little_ship(@first_coordinate_ls, @second_coordinate_ls) #need to pass in two arguments

  end

  def create_little_ship_coordinates
    @first_coordinate_ls = generate_first_little_ship_coordinate
    @second_coordinate_ls = generate_second_little_ship_coordinate
    #
    # "#{generate_first_little_ship_coordinate}"", ""#{generate_second_little_ship_coordinate}"
  end

  def create_big_ship_coordinates
    first_coordinate = generate_first_big_ship_coordinate
    second_coordinate = generate_second_big_ship_coordinate
    third_coordinate = generate_third_big_ship_coordinate
    "#{generate_first_big_ship_coordinate}, #{generate_second_big_ship_coordinate}, #{generate_third_big_ship_coordinate}"
  end


  def generate_second_little_ship_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    # if (@first_coordinate_ls[1] == "1") || (@first_coordinate_ls[1] == "2") || (@first_coordinate_ls[1] == "3")

    if @first_coordinate_ls[1] == "1"
      @second_coordinate_ls = board_array[@ls_starting_index+1]

    elsif @first_coordinate_ls[1] == "2"

        @second_coordinate_ls = board_array[@ls_starting_index+1]
    elsif @first_coordinate_ls[1] == "3"
        @second_coordinate_ls = board_array[@ls_starting_index+1]
    elsif @first_coordinate_ls[1] == "4"
        @second_coordinate_ls = board_array[@ls_starting_index+4]
    end
  end

  def generate_first_big_ship_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    @first_coordinate_bs =  board_array[pick_index_for_big_ship_coordinate]
  end

  def pick_index_for_big_ship_coordinate
    prng = Random.new
    @bs_starting_index = prng.rand(8)
  end

  def generate_second_big_ship_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    @second_coordinate_bs = board_array[@bs_starting_index+4]
  end

  def generate_third_big_ship_coordinate
    board_array = @compboard.make_array_of_empty_spaces
    @second_coordinate_bs = board_array[@bs_starting_index+8]
  end

  def fire_shot
    shot = pick_shot
    @opp_map.mark_hits(shot)
  end

  def pick_shot
    @opp_map.make_array_of_unfired_spaces(pick_index_for_shot_coordinate)
  end

  def ship_hits

  end
  def pick_index_for_shot_coordinate
    prng = Random.new
    prng.rand(15)
  end

end
