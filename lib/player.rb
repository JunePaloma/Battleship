# require './lib/three_unit_ship'
# require './lib/two_unit_ship'
# require './lib/ships'
require './lib/game_runner'
require 'pry'

class Player
  attr_accessor :playerboard,
                :big_ship,
                :little_ship

  def initialize
    @playerboard = GameBoard.new
    # @computer_map = OpponentMap.new
    @first_coordinate_ls = ""
    @second_coordinate_ls = ""
    @first_coodinate_bs = ""
    @second_coordinate_bs = ""
    @third_coordinate_bs = ""
    @little_ship = nil
    @big_ship = nil
  end

  # def player_shoots(coordinate)
  #   if @computer.compboard.boardhash[coordinate] == "Open"
  #     print "Miss"
  #   elsif @computer.compboard.boardhash[coordinate] == "Occupied"
  #     print "Hit"
  #     @computer_map.mark_hits(coordinate)
  #   end
  # end


end
