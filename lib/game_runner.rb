require './lib/computer_player'
require './lib/game_board'
require './lib/opponent_map'

class GameRunner
  attr_accessor :computer,
              :player

  def intialize
    @computer = ComputerPlayer.new
    @player = Player.new
  end

  def computer_places_little_ship
    @computer.
  end

  def computer_places_big_ship
  end

  def player_places_little_ship
  end

  def player_places_big_ship
  end

  def player_shoots_at_computer
  end

  def check_if_player_shot_landed
  end

  def computer_shoots_at_player
    shot = @computer.pick_shot
    @computer.fire_shot
    shot
  end

def check_whether_computer_shot_landed
    shot = computer_shoots_at_player
    @player.playerboard.
    little_ship.coordinate1
end

end
