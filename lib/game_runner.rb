require './lib/computer_player'
require './lib/game_board'
require './lib/opponent_map'

class GameRunner
  def intialize
    @computer = ComputerPlayer.new
    @board = GameBoard.new
    @opp_map = OpponentMap.new
  end

def computer_places_small_ship
  @computer.create_little_ship_coordinates
end



end
