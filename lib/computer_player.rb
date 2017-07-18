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




end
